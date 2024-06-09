import 'package:flutter/material.dart';
import 'package:grocery_app/models/helpers/callback_type.dart';
import 'package:grocery_app/src/utils/constants.dart';
import 'package:grocery_app/src/utils/dimensions.dart';
import 'package:grocery_app/src/utils/styles.dart';
import 'package:grocery_app/src/utils/utils.dart';
import 'package:grocery_app/src/widgets/custom_spannable.dart';
import 'package:url_launcher/url_launcher.dart';

class SpannableText extends StatelessWidget {
  final String textBeforeLink;
  final String? linkText;
  final String textAfterLink;
  final String? boldText;

  const SpannableText(
      {super.key,
      required this.textBeforeLink,
      required this.linkText,
      required this.textAfterLink,
      this.boldText});

  void _launchURL() async {
    Uri uri = Uri.parse("https://gdpr.eu/what-is-gdpr/");
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      Utils.showSnackbar("Unable to open URL", CallbackType.ERROR);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        text: textBeforeLink,
        style: Styles.textStyle(
          fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
          fontWeight: FontWeight.w400,
        ),
        children: [
          boldText != null
              ? TextSpan(
                  text: boldText,
                  style: Styles.textStyle(
                    fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : const TextSpan(text: ""),
          TextSpan(
            text: Constants.ABOUT_H4_TEXT_2_2,
            style: Styles.textStyle(
              fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
              fontWeight: FontWeight.w400,
            ),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.top,
            child: GestureDetector(
              onTap: () {
                if (linkText != null) {
                  _launchURL();
                }
              },
              child: Text(
                linkText ?? "",
                style: Styles.textStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          TextSpan(text: textAfterLink),
        ],
      ),
    );
  }
}
