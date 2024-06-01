import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/src/utils/colors.dart';
import 'package:grocery_app/src/utils/styles.dart';
import 'package:grocery_app/src/widgets/icon_button.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    fontFamily: 'Plus Jakarta Sans',
    unselectedWidgetColor: LightThemeColors.COLOR_DISABLE,
    primaryColor: AppColors.PRIMARY_COLOR,
    datePickerTheme: const DatePickerThemeData(
        backgroundColor: DarkThemeColors.COLOR_BORDER),
    cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
      primaryColor: Colors.blueAccent,
      brightness: Brightness.dark,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: DarkThemeColors.COLOR_DISABLE,
      selectionColor: DarkThemeColors.COLOR_DISABLE.withOpacity(0.4),
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: Styles.customStyle(
          textWeight: TextWeight.BOLD, textSize: TextSize.MEDIUM),
      unselectedLabelStyle: Styles.customStyle(
          textWeight: TextWeight.BOLD, textSize: TextSize.MEDIUM),
      unselectedLabelColor: DarkThemeColors.COLOR_BORDER,
      labelColor: DarkThemeColors.TEXT_WHITE,
      indicatorColor: DarkThemeColors.TEXT_WHITE,
      overlayColor: RippleOverlayColor(Get.theme.primaryColor),
    ),
    colorScheme: ColorScheme.dark(
      primary: DarkThemeColors.NAVY_BLUE,
      surfaceContainer: DarkThemeColors.DARK_BLUE,
      secondary: DarkThemeColors.GREY,
      tertiary: DarkThemeColors.NAVY_BLUE,
      outline: DarkThemeColors.COLOR_BORDER,
      outlineVariant: DarkThemeColors.COLOR_BORDER,
      inversePrimary: DarkThemeColors.COLOR_BORDER_HOME,
      inverseSurface: DarkThemeColors.DARK_BLUE,
      primaryContainer: DarkThemeColors.NAVY_BLUE,
      secondaryContainer: DarkThemeColors.COLOR_BORDER,
      tertiaryContainer: DarkThemeColors.COLOR_BORDER_HOME,
      surfaceTint: DarkThemeColors.COLOR_BORDER_HOME,
      surfaceContainerHighest: DarkThemeColors.NAVY_BLUE,
      onPrimary: DarkThemeColors.TEXT_WHITE,
      onSecondary: DarkThemeColors.TEXT_WHITE_DARK,
      onTertiary: DarkThemeColors.COLOR_DISABLE,
      onSurface: DarkThemeColors.TEXT_WHITE_DARK,
      surface: Colors.grey[800]!,
      onInverseSurface: DarkThemeColors.GREY,
      onSurfaceVariant: DarkThemeColors.GREY,
      onPrimaryContainer: DarkThemeColors.DARK_BLUE,
      onSecondaryContainer: DarkThemeColors.DARK_BLUE,
    ),
  );

  static final lightTheme = ThemeData(
    fontFamily: 'Plus Jakarta Sans',
    unselectedWidgetColor: LightThemeColors.COLOR_DISABLE,
    primaryColor: AppColors.PRIMARY_COLOR,
    datePickerTheme:
        const DatePickerThemeData(backgroundColor: LightThemeColors.WHITE),
    cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
      primaryColor: Colors.blueAccent,
      brightness: Brightness.light,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: LightThemeColors.BLUE,
      selectionColor: LightThemeColors.BLUE.withOpacity(0.4),
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: Styles.customStyle(
          textWeight: TextWeight.BOLD, textSize: TextSize.MEDIUM),
      unselectedLabelStyle: Styles.customStyle(
          textWeight: TextWeight.BOLD, textSize: TextSize.MEDIUM),
      dividerColor: Colors.transparent,
      unselectedLabelColor: LightThemeColors.COLOR_DISABLE,
      labelColor: LightThemeColors.BLUE,
      indicatorColor: LightThemeColors.BLUE,
      overlayColor: RippleOverlayColor(Get.theme.primaryColor),
      indicatorSize: TabBarIndicatorSize.tab,
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.PRIMARY_COLOR,
      background: LightThemeColors.SILVER,
      secondary: LightThemeColors.WHITE_BLUE,
      tertiary: LightThemeColors.BLUE,
      outline: LightThemeColors.WHITE_BLUE,
      outlineVariant: Colors.transparent,
      inversePrimary: LightThemeColors.WHITE_BLUE,
      inverseSurface: LightThemeColors.WHITE,
      primaryContainer: LightThemeColors.WHITE_BLUE,
      secondaryContainer: LightThemeColors.BLUE,
      tertiaryContainer: LightThemeColors.SILVER,
      surfaceTint: LightThemeColors.COLOR_DISABLE_LIGHT,
      surfaceVariant: LightThemeColors.BLUE,
      onPrimary: LightThemeColors.TEXT_BLACK,
      onSecondary: LightThemeColors.TEXT_BLACK_LIGHT,
      onTertiary: LightThemeColors.COLOR_DISABLE,
      onSurface: LightThemeColors.WHITE,
      surface: Colors.grey[800]!,
      onInverseSurface: LightThemeColors.COLOR_DISABLE,
      onBackground: LightThemeColors.SILVER_DARK,
      onPrimaryContainer: LightThemeColors.WHITE_BLUE,
      onSecondaryContainer: LightThemeColors.BLUE,
    ),
  );
}
