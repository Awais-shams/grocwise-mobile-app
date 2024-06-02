import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../utils/styles.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    super.key,
    required this.title,
    this.onTap,
    this.color,
    this.rectangle,
    this.allCaps,
    this.height,
    this.isDisabled,
    this.elevation,
    this.titleColor,
    this.fullWidth,
    this.titleStyle,
    this.padding,
    this.fullWidthPadding,
    this.borderRadius = 5,
  });

  final String title;
  final Color? titleColor;
  final Color? color;
  final Function()? onTap;
  final bool? rectangle;
  final bool? isDisabled;
  final bool? allCaps;
  final double? elevation;
  final double? height;
  final bool? fullWidth;
  final EdgeInsets? fullWidthPadding;
  final TextStyle? titleStyle;
  final EdgeInsets? padding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return fullWidth == true
        ? Row(
            children: [
              Expanded(
                child: Padding(
                  padding: fullWidthPadding ?? EdgeInsets.zero,
                  child: _getButton(context),
                ),
              )
            ],
          )
        : height != null
            ? ConstrainedBox(
                constraints: BoxConstraints(maxHeight: height!),
                child: _getButton(context),
              )
            : _getButton(context);
  }

  Widget _getButton(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: isDisabled == true
            ? Colors.grey[500]
            : color ?? context.theme.colorScheme.tertiary,
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.35.h),
        elevation: elevation ?? 8,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1, color: context.theme.colorScheme.outlineVariant),
          borderRadius: BorderRadius.all(
              Radius.circular(rectangle == true ? borderRadius : 50)),
        ),
      ),
      onPressed: () =>
          {!(isDisabled ?? false) && onTap != null ? onTap!() : null},
      child: Text(
        allCaps == true ? title.toUpperCase() : title,
        style: titleStyle?.apply(color: context.theme.colorScheme.onSurface) ??
            Styles.customStyle(
              textWeight: TextWeight.BOLD,
              textSize: TextSize.SMALL,
              primary: isDisabled != true,
              tertiary: isDisabled == true,
            )?.apply(color: context.theme.colorScheme.onSurface),
      ),
    );
  }
}
