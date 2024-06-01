import 'package:flutter/material.dart';

class RoundedCard extends Card {
  const RoundedCard({
    super.key,
    super.child,
    super.color,
    super.margin,
    super.borderOnForeground,
    super.clipBehavior,
    super.elevation,
    super.semanticContainer,
    super.shadowColor,
    super.surfaceTintColor,
    this.borderRadius,
    this.topLeftBorderRadius,
    this.topRightBorderRadius,
    this.bottomLeftBorderRadius,
    this.bottomRightBorderRadius,
    this.sideColor,
    this.sideWidth = 2,
  });

  final double? borderRadius;
  final double? topLeftBorderRadius;
  final double? topRightBorderRadius;
  final double? bottomLeftBorderRadius;
  final double? bottomRightBorderRadius;
  final double sideWidth;
  final Color? sideColor;

  @override
  ShapeBorder? get shape => topLeftBorderRadius != null ||
          topRightBorderRadius != null ||
          bottomLeftBorderRadius != null ||
          bottomRightBorderRadius != null
      ? RoundedRectangleBorder(
          side: sideColor != null
              ? BorderSide(width: sideWidth, color: sideColor!)
              : BorderSide.none,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeftBorderRadius ?? 0.0),
            topRight: Radius.circular(topRightBorderRadius ?? 0.0),
            bottomLeft: Radius.circular(bottomLeftBorderRadius ?? 0.0),
            bottomRight: Radius.circular(bottomRightBorderRadius ?? 0.0),
          ),
        )
      : borderRadius != null
          ? RoundedRectangleBorder(
              side: sideColor != null
                  ? BorderSide(width: sideWidth, color: sideColor!)
                  : BorderSide.none,
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 0.0)),
            )
          : super.shape;
}
