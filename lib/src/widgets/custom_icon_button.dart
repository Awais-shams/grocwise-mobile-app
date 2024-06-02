import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.widget,
    required this.onTap,
    this.padding = EdgeInsets.zero,
    this.radius = BorderRadius.zero,
    required this.size,
  });

  final Widget? widget;
  final Function onTap;
  final EdgeInsets padding;
  final BorderRadius radius;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.colorScheme.primary,
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        overlayColor: RippleOverlayColor(context.theme.primaryColor),
        child: SizedBox(
            height: size.height,
            width: size.width,
            child: Padding(padding: padding, child: widget)),
        onTap: () => onTap.call(),
      ),
    );
  }
}

@immutable
class RippleOverlayColor extends MaterialStateProperty<Color?> {
  RippleOverlayColor(this.primary);

  final Color primary;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.hovered)) {
      return primary.withOpacity(0.04);
    }
    if (states.contains(MaterialState.focused) ||
        states.contains(MaterialState.pressed)) {
      return primary.withOpacity(0.12);
    }
    return null;
  }

  @override
  String toString() {
    return '{hovered: ${primary.withOpacity(0.04)}, focused,pressed: ${primary.withOpacity(0.12)}, otherwise: null}';
  }
}
