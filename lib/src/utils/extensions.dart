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

extension DoubleCasingExtension on double {
  SizedBox get marginVertical => SizedBox(height: this);

  SizedBox get marginHorizontal => SizedBox(width: this);

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

extension ColorExtensions on Color {
  Color light([int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var p = percent / 100;
    return Color.fromARGB(alpha, red + ((255 - red) * p).round(),
        green + ((255 - green) * p).round(), blue + ((255 - blue) * p).round());
  }

  Color dark([int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var f = 1 - percent / 100;
    return Color.fromARGB(
        alpha, (red * f).round(), (green * f).round(), (blue * f).round());
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
