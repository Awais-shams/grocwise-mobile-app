import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

mixin Dimensions {
  static final TOOLBAR_HEIGHT = 110.0;
  static final AUTH_IMAGE_SIZE_MEDIUM = 30.h;
  static final AUTH_IMAGE_SIZE_LARGE = 40.h;
  static const HORIZONTAL_PADDING = 25.0;

  static final TEXT_SIZE_HEADING = Platform.isIOS ? 20.0.sp : 18.0.sp;
  static final TEXT_SIZE_LARGE = Platform.isIOS ? 14.0.sp : 13.0.sp;
  static final TEXT_SIZE_SEMI_LARGE = Platform.isIOS ? 12.5.sp : 11.0.sp;
  static final TEXT_SIZE_MEDIUM = Platform.isIOS ? 11.5.sp : 10.0.sp;
  static final TEXT_SIZE_NORMAL = Platform.isIOS ? 10.5.sp : 10.0.sp;
  static final TEXT_SIZE_SMALL = Platform.isIOS ? 9.5.sp : 9.0.sp;
  static final TEXT_SIZE_TINY = Platform.isIOS ? 8.5.sp : 7.0.sp;

  static const TOOLBAR_ICON_SIZE = 25.0;

  static const PADDING_LOGBOOK_CHECK_IN =
      EdgeInsets.symmetric(horizontal: 12, vertical: 10);
}
