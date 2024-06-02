import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/base/base_view_model_listener.dart';
import 'package:provider/provider.dart';

import 'base_view_model.dart';

abstract class BaseScreen<C extends StatefulWidget, V extends BaseViewModel?>
    extends State<C> with BaseVMlListeners {
  V? viewModel;

  //if viewModel needs to clear when the screen is disposed this method will be used.
  bool clearViewModelOnDispose() => true;

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<V>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      viewModel?.listeners = this;
    });
  }

  @override
  void dispose() {
    if (clearViewModelOnDispose()) {
      viewModel?.clearViewModel();
    }
    super.dispose();
  }

  void gotoScreen(String routeName, {bool? clearStack, dynamic arguments}) {
    clearStack == true
        ? Get.offAllNamed(routeName, arguments: arguments)
        : Get.toNamed(routeName, arguments: arguments);
  }

  void goBack() {
    Get.closeCurrentSnackbar();
    Get.back();
  }
}
