import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/src/utils/images.dart';

class CircularNetworkImage extends StatelessWidget {
  const CircularNetworkImage({
    super.key,
    this.url,
    required this.radius,
    this.width,
    this.height,
    this.fit = BoxFit.fill,
    this.errorHolder,
    this.placeHolder,
    this.showPlaceholder = true,
    this.showErrorOnNullUrl = false,
    this.borderColor,
    this.borderWidth = 0.0,
    this.applyCacheSize = true,
    this.applyRadiusOnBottom = true,
    this.showBrokenImageOnError = false,
  });

  final String? url;
  final double radius;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Widget? errorHolder;
  final Widget? placeHolder;
  final bool showPlaceholder;
  final bool showErrorOnNullUrl;
  final double borderWidth;
  final Color? borderColor;
  final bool applyCacheSize;
  final bool applyRadiusOnBottom;
  final bool showBrokenImageOnError;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(borderWidth),
      decoration: BoxDecoration(color: borderColor, shape: BoxShape.rectangle),
      child: ClipRRect(
        borderRadius: applyRadiusOnBottom == true
            ? BorderRadius.all(Radius.circular(radius.toDouble()))
            : BorderRadius.only(
                topLeft: Radius.circular(radius.toDouble()),
                topRight: Radius.circular(radius.toDouble()),
              ),
        child: url != null && url?.isEmpty == false
            ? CachedNetworkImage(
                memCacheWidth:
                    applyCacheSize ? ((width ?? (radius * 2)).toInt()) : null,
                memCacheHeight:
                    applyCacheSize ? ((height ?? (radius * 2)).toInt()) : null,
                imageUrl: url!,
                height: height ?? (radius * 2),
                width: width ?? (radius * 2),
                errorWidget: (_, __, ___) =>
                    Center(child: errorHolder ?? _getErrorWidget()),
                placeholder: (_, __) => showPlaceholder
                    ? (placeHolder ?? _getUserImageError())
                    : Container(),
                fit: fit,
              )
            : showErrorOnNullUrl
                ? (errorHolder ?? _getErrorWidget())
                : _getBrokenImageError(),
      ),
    );
  }

  _getBrokenImageError() => SvgPicture.asset(
        AppImages.getDummyImage(),
        height: height ?? (radius * 2),
        width: width ?? (radius * 2),
      );

  _getUserImageError() => SvgPicture.asset(
        AppImages.getDummyImage(),
        height: height ?? (radius * 2),
        width: width ?? (radius * 2),
      );

  _getErrorWidget() =>
      showBrokenImageOnError ? _getBrokenImageError() : _getUserImageError();
}
