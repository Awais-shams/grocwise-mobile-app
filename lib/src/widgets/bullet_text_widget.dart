import 'package:flutter/material.dart';
import 'package:grocery_app/src/utils/dimensions.dart';
import 'package:grocery_app/src/utils/extensions.dart';
import 'package:grocery_app/src/utils/styles.dart';

class BulletText extends StatelessWidget {
  const BulletText({super.key, required this.heading, required this.text});

  final String heading;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Text("•  ",
                  style: Styles.textStyle(
                    fontSize: Dimensions.TEXT_SIZE_LARGE,
                    fontWeight: FontWeight.w800,
                  )),
            ),
            TextSpan(
                text: heading,
                style: Styles.textStyle(
                  fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
                  fontWeight: FontWeight.w600,
                )),
            WidgetSpan(child: 5.marginHorizontal),
            TextSpan(
              text: text,
              style: Styles.textStyle(
                fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
