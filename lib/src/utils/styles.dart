// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/src/utils/colors.dart';
import 'package:grocery_app/src/utils/dimensions.dart';

enum TextWeight { NORMAL, MEDIUM, BOLD }

enum TextSize { TINY, SMALL, MEDIUM, SEMI_LARGE, LARGE, HEADING }

class Styles {
  static TextStyle? customStyle({
    bool primary = true,
    bool secondary = false,
    bool inverseSurface = false,
    bool tertiary = false,
    TextWeight textWeight = TextWeight.NORMAL,
    TextSize textSize = TextSize.TINY,
  }) =>
      TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: textSize == TextSize.TINY
            ? Dimensions.TEXT_SIZE_TINY
            : textSize == TextSize.SMALL
                ? Dimensions.TEXT_SIZE_SMALL
                : textSize == TextSize.MEDIUM
                    ? Dimensions.TEXT_SIZE_MEDIUM
                    : textSize == TextSize.SEMI_LARGE
                        ? Dimensions.TEXT_SIZE_SEMI_LARGE
                        : textSize == TextSize.LARGE
                            ? Dimensions.TEXT_SIZE_LARGE
                            : Dimensions.TEXT_SIZE_HEADING,
        fontWeight: textWeight == TextWeight.NORMAL
            ? FontWeight.normal
            : textWeight == TextWeight.MEDIUM
                ? FontWeight.w500
                : FontWeight.bold,
        color: tertiary
            ? Get.theme.colorScheme.onTertiary
            : secondary
                ? Get.theme.colorScheme.onSecondary
                : inverseSurface
                    ? Get.theme.colorScheme.onInverseSurface
                    : Get.theme.colorScheme.onPrimary,
      );
  static TextStyle textStyle(
          {Color color = AppColors.SECONDARY_COLOR,
          double fontSize = 10,
          FontWeight fontWeight = FontWeight.w600}) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: 'Plus Jakarta Sans',
        fontWeight: fontWeight,
      );
  static getLogbookHeadingStyle() => TextStyle(
        color: Get.context!.theme.colorScheme.onInverseSurface,
        fontWeight: FontWeight.w600,
        fontSize: Dimensions.TEXT_SIZE_NORMAL,
      );

  static getStaticBoxShadow() => [
        BoxShadow(
          color: Get.context!.theme.colorScheme.brightness == Brightness.dark
              ? Colors.transparent
              : Colors.grey.withOpacity(0.5),
          spreadRadius: -0.5,
          blurRadius: 0.8,
          offset: const Offset(0.5, 1.5),
        ),
      ];
}
