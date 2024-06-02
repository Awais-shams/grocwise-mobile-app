import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/base/base_view_model_listener.dart';
import 'package:grocery_app/models/helpers/callback_type.dart';
import 'package:grocery_app/src/services/internet_service.dart';
import 'package:grocery_app/src/services/services.dart';
import 'package:grocery_app/src/utils/constants.dart';
import 'package:grocery_app/src/utils/utils.dart';
import 'package:grocery_app/src/widgets/dialog_no_internet.dart';

import '../models/response/base_response.dart';

class BaseViewModel<L extends BaseVMlListeners> extends ChangeNotifier {
  final InternetService _internetService = InternetService();
  L? listeners;
  bool showErrorMessage = false;
  bool isLoading = false;

  getListenersType() => L.reactive.value;

  clearViewModel() {}

  fetchData<T>({
    required Future<BaseResponse>? Function() remoteMethod,
    Future<BaseResponse>? Function()? localMethod,
    Future<BaseResponse>? Function(T)? saveIntoDbMethod,
    required Function(T) onSuccess,
    Function(String, int)? onError,
    showLoader = true,
    hideLoaderOnSuccess = true,
    showError = true,
    notifyOnEnd = false,
    saveDataOnRemoteResponse = true,
    abortOnNoInternet = true,
    showDialogOnError = true,
  }) async {
    try {
      if (showLoader && !LoaderService.isLoaderShowing) {
        LoaderService.showLoader();
      }

      BaseResponse? response;

      //checking if internet is connected
      if (await _internetService.isInternetConnected()) {
        //call remote method
        response = await remoteMethod.call();
        //if data fetch from remote needs to save in local database for offline support
        if (saveDataOnRemoteResponse) {
          //check if response is successful then store data into database
          if (response?.haveError() == false) {
            await saveIntoDbMethod?.call(response?.data as T);
          }
        }
      } else {
        //if not internet get data from local storage only if abortOnNoInternet is false
        if (abortOnNoInternet) {
          //show error and abort operation if there is no internet
          var message = 'no_internet'.tr;
          if (showDialogOnError) {
            LoaderService.hideLoader();
            Utils.showCustomDialog(
              DialogNoInternet(message: 'no_internet'.tr),
              backgroundColor: Colors.transparent,
            );
          } else {
            Utils.showSnackbar(message, CallbackType.ERROR);
          }
          onError?.call(message.tr, 0);
          response = null;
        } else {
          //get data from local if no internet
          response = await localMethod?.call();
        }
      }

      if (response != null) {
        if (response.haveError() == true) {
          var message = response.error ?? response.msg;
          message ??= 'Unknown error';

          if (message == Constants.API_SESSION_EXPIRE) {
            // Utils.showSnackbar('session_expired'.tr, CallbackType.ERROR);
            await listeners?.onSessionExpired();
          } else {
            LoaderService.hideLoader();
            if (showError) {
              if (message == Constants.INTERNET_ERROR && showDialogOnError) {
                Utils.showCustomDialog(
                  DialogNoInternet(message: 'internet_error'.tr),
                  backgroundColor: Colors.transparent,
                );
              } else {
                Utils.showSnackbar(
                  message == Constants.INTERNET_ERROR
                      ? 'internet_error'.tr
                      : message.toString(),
                  CallbackType.ERROR,
                );
              }
            }
            onError?.call(message.toString(), response.code ?? 0);
          }
        } else {
          onSuccess(response.data as T);
        }
      }

      if (showLoader && hideLoaderOnSuccess) LoaderService.hideLoader();

      if (notifyOnEnd) notifyListeners();
    } catch (ex) {
      ex.printInfo();
      if (showLoader) LoaderService.hideLoader();
      Utils.showSnackbar(ex.toString(), CallbackType.ERROR);
      onError?.call(ex.toString(), ex.hashCode);
    }
  }
}
