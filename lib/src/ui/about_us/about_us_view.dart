import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/base/base_screen.dart';
import 'package:grocery_app/src/ui/home/home_vm.dart';
import 'package:grocery_app/src/utils/constants.dart';
import 'package:grocery_app/src/utils/dimensions.dart';
import 'package:grocery_app/src/utils/extensions.dart';
import 'package:grocery_app/src/utils/styles.dart';
import 'package:grocery_app/src/widgets/bullet_text_widget.dart';
import 'package:grocery_app/src/widgets/spannable_text.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => AboutUsViewContent();
}

class AboutUsViewContent extends BaseScreen<AboutUsView, HomeVM>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ColoredBox(
      color: Get.theme.colorScheme.primaryContainer,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Text(Constants.ABOUT_H1_TEXT,
                  textAlign: TextAlign.justify,
                  style: Styles.textStyle(
                    fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
                    fontWeight: FontWeight.w400,
                  )),
            ),
            5.marginVertical,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Text(Constants.ABOUT_H2,
                  style: Styles.textStyle(
                    fontSize: Dimensions.TEXT_SIZE_LARGE,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            5.marginVertical,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(Constants.ABOUT_H2_TEXT,
                  textAlign: TextAlign.justify,
                  style: Styles.textStyle(
                    fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
                    fontWeight: FontWeight.w400,
                  )),
            ),
            5.marginVertical,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Text(Constants.ABOUT_H3,
                  style: Styles.textStyle(
                    fontSize: Dimensions.TEXT_SIZE_LARGE,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            5.marginVertical,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(Constants.ABOUT_H3_TEXT,
                  textAlign: TextAlign.justify,
                  style: Styles.textStyle(
                    fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
                    fontWeight: FontWeight.w400,
                  )),
            ),
            5.marginVertical,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Text(Constants.ABOUT_H4,
                  style: Styles.textStyle(
                    fontSize: Dimensions.TEXT_SIZE_LARGE,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            5.marginVertical,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SpannableText(
                  textBeforeLink: Constants.ABOUT_H4_TEXT_1,
                  linkText: Constants.ABOUT_H4_TEXT_2,
                  textAfterLink: Constants.ABOUT_H4_TEXT_3),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Text(Constants.ABOUT_H5,
                  style: Styles.textStyle(
                    fontSize: Dimensions.TEXT_SIZE_LARGE,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            5.marginVertical,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => 2.marginVertical,
                itemCount: Constants.LIST_OF_H5.length,
                itemBuilder: (context, index) {
                  return BulletText(
                      heading: Constants.LIST_OF_H5[index].heading,
                      text: Constants.LIST_OF_H5[index].text);
                },
              ),
            ),
            5.marginVertical,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Text(Constants.ABOUT_H6,
                  style: Styles.textStyle(
                    fontSize: Dimensions.TEXT_SIZE_LARGE,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            5.marginVertical,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(Constants.ABOUT_H6_TEXT,
                  textAlign: TextAlign.justify,
                  style: Styles.textStyle(
                    fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
                    fontWeight: FontWeight.w400,
                  )),
            ),
            5.marginVertical,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(Constants.ABOUT_H7_TEXT,
                  textAlign: TextAlign.justify,
                  style: Styles.textStyle(
                    fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
                    fontWeight: FontWeight.w400,
                  )),
            ),
            5.marginVertical,
          ],
        ),
      ),
    );
  }

  @override
  void updateKeepAlive() {}

  @override
  bool get wantKeepAlive => true;
}
