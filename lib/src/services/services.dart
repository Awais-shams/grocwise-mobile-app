import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/src/widgets/rounded_card.dart';

class LoaderService {
  static bool isLoaderShowing = false;

  static void showLoader() {
    if (!isLoaderShowing) {
      BotToast.showCustomLoading(
        onClose: () => isLoaderShowing = false,
        toastBuilder: (void Function() cancelFunc) => RoundedCard(
          color: Colors.black38,
          borderRadius: 10,
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              height: 35,
              width: 35,
              child: CircularProgressIndicator(
                color: Get.context!.theme.primaryColor,
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ),
      );
      isLoaderShowing = true;
    }
  }

  static void hideLoader() {
    BotToast.closeAllLoading();
    isLoaderShowing = false;
  }
}
