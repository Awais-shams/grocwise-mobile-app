import 'package:flutter/material.dart';
import 'package:grocery_app/src/utils/dimensions.dart';
import 'package:grocery_app/src/utils/styles.dart';

class CustomSpannableText extends StatelessWidget {
  final String textBefore;
  final String textBold;
  final String textAfter;

  const CustomSpannableText(
      {super.key,
      required this.textBefore,
      required this.textBold,
      required this.textAfter});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        style: Styles.textStyle(
          fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(text: textBefore),
          TextSpan(
            text: textBold,
            style: Styles.textStyle(
              fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(text: textAfter),
        ],
      ),
    );
  }
}
