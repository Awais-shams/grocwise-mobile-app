import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

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
}
