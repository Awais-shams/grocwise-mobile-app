import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grocery_app/src/utils/extensions.dart';
import 'package:grocery_app/src/utils/styles.dart';
import 'package:grocery_app/src/widgets/icon_button.dart';
import 'package:sizer/sizer.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    this.text,
    this.hintText,
    this.labelText,
    this.controller,
    this.heading,
    this.onEditingComplete,
    this.onTapOutside,
    this.onChange,
    this.node,
    this.onClickWhenDisabled,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.clickableOnly = false,
    this.editable = true,
    this.singleLineHeading = false,
    this.startIcon,
    this.endIcon,
    this.textStyle,
    this.onEndIconClicked,
    this.inputDecoration,
    this.onTap,
    this.inputFieldFillColor = Colors.transparent,
    this.obscureText = false,
    this.shouldValidate = false,
    this.startBoxConstraint,
    this.endBoxConstraint,
    this.borderColor,
    this.radius,
    this.cursorColor,
    this.fieldKey,
    this.height,
    this.autofillHints,
    this.paddingVertical,
    this.maxLines,
    this.maxLength,
    this.verticalAlignment = TextAlignVertical.top,
    this.borderWidth,
    this.headingStyle,
    this.inputFormatters,
    this.autoFocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.showBorderWhenDisabled = false,
    this.textAlignment,
  });

  final String? text;
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final FocusNode? node;
  final String? heading;
  final Function(String)? onChange;
  final Function()? onEditingComplete;
  final Function()? onClickWhenDisabled;
  final Function()? onTapOutside;
  final Function()? onTap;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final bool clickableOnly;
  final bool editable;
  final Widget? startIcon;
  final Widget? endIcon;
  final TextStyle? textStyle;
  final Function()? onEndIconClicked;
  final String? Function(String?)? validator;
  final bool shouldValidate;
  final Color? inputFieldFillColor;
  final bool obscureText;
  final InputDecorationTheme? inputDecoration;
  final Color? borderColor;
  final double? radius;
  final Color? cursorColor;
  final GlobalObjectKey<FormFieldState>? fieldKey;
  final double? height;
  final Iterable<String>? autofillHints;
  final double? paddingVertical;
  final int? maxLines;
  final int? maxLength;
  final TextAlignVertical verticalAlignment;
  final BoxConstraints? startBoxConstraint;
  final BoxConstraints? endBoxConstraint;
  final double? borderWidth;
  final TextStyle? headingStyle;
  final List<TextInputFormatter>? inputFormatters;
  final bool autoFocus;
  final TextCapitalization textCapitalization;
  final bool showBorderWhenDisabled;
  final TextAlign? textAlignment;
  final bool singleLineHeading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: heading != null,
          child: Text(
            heading ?? '',
            maxLines: singleLineHeading ? 1 : null,
            overflow: singleLineHeading ? TextOverflow.ellipsis : null,
            style: headingStyle ??
                Styles.customStyle(
                  textWeight: TextWeight.MEDIUM,
                  textSize: TextSize.SMALL,
                  inverseSurface: true,
                ),
          ),
        ),
        Visibility(visible: heading != null, child: 5.marginVertical),
        !clickableOnly
            ? (height == null
                ? _getTextField(context)
                : SizedBox(height: height!, child: _getTextField(context)))
            : InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                overlayColor: RippleOverlayColor(context.theme.primaryColor),
                onTap: () => onClickWhenDisabled?.call(),
                child: IgnorePointer(
                  child: height == null
                      ? _getTextField(context)
                      : SizedBox(
                          height: height!, child: _getTextField(context)),
                ),
              ),
      ],
    );
  }

  _getTextField(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus,
      key: fieldKey,
      autofillHints: autofillHints,
      obscureText: obscureText,
      enableSuggestions: autofillHints != null,
      initialValue: text,
      readOnly: !editable,
      expands: height != null,
      maxLines: height != null ? null : (maxLines ?? 1),
      minLines: height == null ? 1 : null,
      textAlignVertical: verticalAlignment,
      style: textStyle ?? Styles.customStyle(textSize: TextSize.SMALL),
      controller: controller,
      focusNode: node,
      textAlign: textAlignment ?? TextAlign.start,
      autocorrect: false,
      textCapitalization: textCapitalization,
      cursorColor: cursorColor ?? context.theme.textSelectionTheme.cursorColor,
      selectionControls: _CustomColorSelectionHandle(
          context.theme.textSelectionTheme.cursorColor!),
      keyboardType: keyboardType,
      textInputAction: textInputAction ?? TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTap: () => onTap?.call(),
      maxLength: maxLength,
      onTapOutside: (pet) => onTapOutside?.call() ?? node?.unfocus(),
      onChanged: (String value) => onChange != null ? onChange!(value) : null,
      onEditingComplete: () =>
          onEditingComplete != null ? onEditingComplete!() : null,
      inputFormatters: inputFormatters ??
          (keyboardType == TextInputType.number
              ? [FilteringTextInputFormatter.digitsOnly]
              : null),
      decoration: InputDecoration(
        counterText: "",
        hintText: hintText,
        labelText: labelText,
        prefixIcon: startIcon,
        hintStyle: Styles.customStyle(textSize: TextSize.SMALL)?.apply(
          color: context.theme.colorScheme.onInverseSurface.withOpacity(0.75),
        ),
        prefixIconColor: context.theme.colorScheme.onInverseSurface,
        suffixIconColor: context.theme.colorScheme.onInverseSurface,
        prefixIconConstraints: startBoxConstraint ??
            const BoxConstraints(minWidth: 35, minHeight: 18),
        suffixIconConstraints: endBoxConstraint ??
            const BoxConstraints(minWidth: 35, minHeight: 18),
        suffixIcon: endIcon != null
            ? GestureDetector(
                child: endIcon, onTap: () => onEndIconClicked?.call())
            : null,
      ).applyDefaults(
        inputDecoration ??
            InputDecorationTheme(
              fillColor: inputFieldFillColor,
              filled: inputFieldFillColor != null &&
                  inputFieldFillColor != Colors.transparent,
              hintStyle: Styles.customStyle(textSize: TextSize.SMALL)?.apply(
                color: context.theme.colorScheme.onInverseSurface
                    .withOpacity(0.75),
              ),
              labelStyle:
                  Styles.customStyle(textSize: TextSize.SMALL, secondary: true),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: paddingVertical ?? 10,
                  vertical: paddingVertical ?? 1.1.h),
              isDense: true,
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius ?? 4)),
                borderSide: editable || showBorderWhenDisabled
                    ? BorderSide(
                        color: borderColor ??
                            context.theme.colorScheme.onInverseSurface,
                        width: borderWidth ?? 1.5,
                      )
                    : BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius ?? 4)),
                borderSide: editable || showBorderWhenDisabled
                    ? BorderSide(
                        color: borderColor ??
                            context.theme.colorScheme.onInverseSurface,
                        width: borderWidth ?? 1.5,
                      )
                    : BorderSide.none,
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius ?? 4)),
                borderSide: editable || showBorderWhenDisabled
                    ? BorderSide(
                        color: borderColor ??
                            context.theme.colorScheme.onInverseSurface,
                        width: borderWidth ?? 1.5,
                      )
                    : BorderSide.none,
              ),
            ),
      ),
      validator: (value) {
        return shouldValidate
            ? (validator?.call(value) ??
                (value == null || value == "" ? "enter_value".tr : null))
            : null;
      },
    );
  }
}

class _CustomColorSelectionHandle extends TextSelectionControls {
  _CustomColorSelectionHandle(this.handleColor)
      : _controls = Platform.isIOS
            ? cupertinoTextSelectionControls
            : materialTextSelectionControls;

  final Color handleColor;
  final TextSelectionControls _controls;

  /// Wrap the given handle builder with the needed theme data for
  /// each platform to modify the color.
  Widget _wrapWithThemeData(Widget Function(BuildContext) builder) =>
      Platform.isIOS
          // ios handle uses the CupertinoTheme primary color, so override that.
          ? CupertinoTheme(
              data: CupertinoThemeData(primaryColor: handleColor),
              child: Builder(builder: builder),
            )
          // material handle uses the selection handle color, so override that.
          : TextSelectionTheme(
              data: TextSelectionThemeData(selectionHandleColor: handleColor),
              child: Builder(builder: builder),
            );

  @override
  Widget buildHandle(BuildContext context, TextSelectionHandleType type,
          double textLineHeight,
          [VoidCallback? onTap]) =>
      _wrapWithThemeData(
        (BuildContext context) =>
            _controls.buildHandle(context, type, textLineHeight, onTap),
      );

  @override
  Offset getHandleAnchor(TextSelectionHandleType type, double textLineHeight) {
    return _controls.getHandleAnchor(type, textLineHeight);
  }

  @override
  Size getHandleSize(double textLineHeight) {
    return _controls.getHandleSize(textLineHeight);
  }

  @override
  Widget buildToolbar(
    BuildContext context,
    Rect globalEditableRegion,
    double textLineHeight,
    Offset selectionMidpoint,
    List<TextSelectionPoint> endpoints,
    TextSelectionDelegate delegate,
    ValueListenable<ClipboardStatus>? clipboardStatus, // different type
    Offset? lastSecondaryTapDownPosition,
  ) {
    // ignore: deprecated_member_use
    return _controls.buildToolbar(
      context,
      globalEditableRegion,
      textLineHeight,
      selectionMidpoint,
      endpoints,
      delegate,
      clipboardStatus,
      lastSecondaryTapDownPosition,
    );
  }
}
