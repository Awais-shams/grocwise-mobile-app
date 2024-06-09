import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:grocery_app/base/base_screen.dart';
import 'package:grocery_app/models/helpers/callback_type.dart';
import 'package:grocery_app/src/ui/home/home_vm.dart';
import 'package:grocery_app/src/utils/constants.dart';
import 'package:grocery_app/src/utils/dimensions.dart';
import 'package:grocery_app/src/utils/extensions.dart';
import 'package:grocery_app/src/utils/styles.dart';
import 'package:grocery_app/src/utils/utils.dart';
import 'package:grocery_app/src/widgets/rounded_card.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => ContactUsViewContent();
}

class ContactUsViewContent extends BaseScreen<ContactUsView, HomeVM>
    with AutomaticKeepAliveClientMixin {
  void _launchURL(String text) async {
    print("URLS::$text");
    Uri uri = Uri.parse(text);
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
    super.build(context);
    return ColoredBox(
      color: Get.theme.colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              Constants.CONTACT_US_HEADING,
              style: Styles.textStyle(
                fontSize: 26.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            10.marginVertical,
            SizedBox(
              width: Get.width,
              child: RoundedCard(
                borderRadius: 10,
                elevation: 10,
                color: Get.theme.colorScheme.primary,
                sideColor: Get.theme.colorScheme.primary,
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, top: 15, right: 10, bottom: 15),
                    child: Text(
                      Constants.CONTACT_US_SECOND,
                      style: Styles.textStyle(
                          color: context.theme.colorScheme.onSurface,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp),
                    )),
              ),
            ),
            10.marginVertical,
            Text(
              Constants.CONTACT_US_THIRD,
              style: Styles.textStyle(
                fontSize: Dimensions.TEXT_SIZE_LARGE,
                fontWeight: FontWeight.w600,
              ),
            ),
            contactCard(Icons.email_outlined, Constants.CONTACT_MAIL),
            10.marginVertical,
            Text(
              Constants.CONTACT_US_FOUR,
              style: Styles.textStyle(
                fontSize: Dimensions.TEXT_SIZE_LARGE,
                fontWeight: FontWeight.w600,
              ),
            ),
            contactCard(
              FontAwesomeIcons.github,
              Constants.CONTACT_GITHUB,
              openUrl: (p0) => _launchURL(p0),
            ),
            10.marginVertical,
            contactCard(
              FontAwesomeIcons.linkedin,
              Constants.CONTACT_LINKEDIN,
              iconColor: context.theme.colorScheme.onSecondaryContainer,
              openUrl: (p0) => _launchURL(p0),
            ),
            10.marginVertical,
            contactCard(
              FontAwesomeIcons.medium,
              Constants.CONTACT_MEDIUM,
              openUrl: (p0) => _launchURL(p0),
            ),
            10.marginVertical,
            Text(
              Constants.CONTACT_US_H2,
              style: Styles.textStyle(
                fontSize: Dimensions.TEXT_SIZE_LARGE,
                fontWeight: FontWeight.w600,
              ),
            ),
            5.marginVertical,
            Text(Constants.CONTACT_US_H2_TEXT,
                textAlign: TextAlign.justify,
                style: Styles.textStyle(
                  fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
                  fontWeight: FontWeight.w400,
                )),
            5.marginVertical,
            Text(Constants.CONTACT_US_THANK,
                textAlign: TextAlign.justify,
                style: Styles.textStyle(
                  fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
                  fontWeight: FontWeight.w400,
                )),
            5.marginVertical,
          ]),
        ),
      ),
    );
  }

  Widget contactCard(IconData icon, String text,
      {Color? iconColor, Function(String)? openUrl}) {
    return SizedBox(
      width: Get.width,
      child: RoundedCard(
        sideWidth: 1,
        borderRadius: 10,
        color: Get.theme.colorScheme.onSurface,
        sideColor: Get.theme.colorScheme.onSurface,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.theme.colorScheme.onSurface,
                    border: Border.all(
                        color: iconColor ?? context.theme.colorScheme.primary,
                        width: 1.5)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      icon,
                      color: iconColor ?? context.theme.colorScheme.primary,
                    ),
                  ),
                ),
              ),
              10.marginHorizontal,
              Expanded(
                child: SelectableText(
                  onTap: () => openUrl?.call(text),
                  text,
                  textAlign: TextAlign.start,
                  style: Styles.textStyle(
                      fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void updateKeepAlive() {}

  @override
  bool get wantKeepAlive => true;
}
