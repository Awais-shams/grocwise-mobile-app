import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

extension IntCasingExtension on int {
  SizedBox get marginVertical => SizedBox(height: toDouble());

  SizedBox get marginHorizontal => SizedBox(width: toDouble());

  double get sp {
    var screenSize = SizerUtil.width;
    var scaleFactor = SizerUtil.deviceType == DeviceType.tablet
        ? (screenSize > 600 && screenSize <= 1000
            ? 3
            : screenSize > 1000 && screenSize <= 1300
                ? 4
                : 5)
        : 3;
    return this * (SizerUtil.width / scaleFactor) / 100;
  }
}

extension IterableExtension on Iterable {
  Iterable<R>? mapIndexed<R, T>(
      R Function(int index, T element) convert) sync* {
    var index = 0;
    for (var element in this) {
      yield convert(index++, element);
    }
  }
}
