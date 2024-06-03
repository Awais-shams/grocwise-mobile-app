import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grocery_app/models/helpers/callback_type.dart';
import 'package:grocery_app/src/utils/styles.dart';

class Utils {
  static void setupSystemBarIcons({
    BuildContext? context,
    Brightness? statusBarDarkIcons,
    Brightness? navigationBarDarkIcons,
    Color statusBarColor = Colors.transparent,
    Color? navigationBarColor,
  }) {
    final theme = (context?.theme ?? Get.theme);
    bool darkTheme = false;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        systemNavigationBarColor:
            navigationBarColor ?? theme.colorScheme.surface,
        statusBarIconBrightness: statusBarDarkIcons ??
            (darkTheme ? Brightness.light : Brightness.dark),
        statusBarBrightness: statusBarDarkIcons ??
            (darkTheme ? Brightness.dark : Brightness.light),
        systemNavigationBarIconBrightness: navigationBarDarkIcons ??
            (darkTheme ? Brightness.dark : Brightness.light),
      ),
    );
  }

  static bool needSaveArea() => Get.mediaQuery.viewPadding.bottom > 0;
  static bool needSaveAreaTop() => Get.mediaQuery.viewPadding.top > 0;
  static void showCustomDialog(
    Widget dialog, {
    Color? backgroundColor,
    Color? barrierColor,
    EdgeInsets? insetPadding,
    double? elevation,
    Function()? onDismiss,
    bool? cancelable,
  }) async {
    await Get.generalDialog(
      pageBuilder: (_, __, ___) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          insetPadding: insetPadding ?? const EdgeInsets.all(15),
          elevation: elevation ?? 10,
          backgroundColor: backgroundColor ?? Colors.white,
          surfaceTintColor: backgroundColor ?? Colors.white,
          child: dialog,
        );
      },
      barrierDismissible: cancelable ?? true,
      barrierLabel: "customDialog",
      barrierColor: barrierColor ?? const Color(0x80000000),
    );
    onDismiss != null ? onDismiss() : null;
  }

  static void showSnackbar(
    String msg,
    CallbackType? type, {
    Function()? onDismiss,
    Duration duration = const Duration(milliseconds: 2500),
  }) {
    var snackbar = SnackBar(
      content: Text(msg,
          style: Styles.customStyle(textSize: TextSize.SMALL)
              ?.apply(color: Colors.white)),
      duration: duration,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 13),
      behavior: SnackBarBehavior.floating,
      // boxShadows: const [BoxShadow(color: Colors.grey, blurRadius: 10, offset: Offset(3, 2))],
      backgroundColor: (type == CallbackType.ERROR
              ? Get.context!.theme.colorScheme.error
              : type == CallbackType.SUCCESS
                  ? Colors.green
                  : type == CallbackType.WARN
                      ? Colors.yellow
                      : Colors.grey[800]) ??
          Colors.grey,
    );

    ScaffoldMessenger.of(Get.context!)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackbar);
  }
}
