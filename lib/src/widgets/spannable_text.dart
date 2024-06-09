import 'package:flutter/material.dart';
import 'package:grocery_app/models/helpers/callback_type.dart';
import 'package:grocery_app/src/utils/dimensions.dart';
import 'package:grocery_app/src/utils/styles.dart';
import 'package:grocery_app/src/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class SpannableText extends StatelessWidget {
  final String textBeforeLink;
  final String linkText;
  final String textAfterLink;

  const SpannableText(
      {super.key,
      required this.textBeforeLink,
      required this.linkText,
      required this.textAfterLink});

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
        style: Styles.textStyle(
          fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(text: textBeforeLink),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: GestureDetector(
              onTap: _launchURL,
              child: Text(
                linkText,
                style: Styles.textStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
                  fontWeight: FontWeight.w400,
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
