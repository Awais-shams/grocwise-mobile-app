import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/base/base_screen.dart';
import 'package:grocery_app/src/ui/home/home_vm.dart';
import 'package:grocery_app/src/utils/constants.dart';
import 'package:grocery_app/src/utils/dimensions.dart';
import 'package:grocery_app/src/utils/extensions.dart';
import 'package:grocery_app/src/utils/styles.dart';
import 'package:grocery_app/src/widgets/rounded_card.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => ContactUsViewContent();
}

class ContactUsViewContent extends BaseScreen<ContactUsView, HomeVM>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ColoredBox(
      color: context.theme.colorScheme.onSurface,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: Get.width,
                child: RoundedCard(
                  sideWidth: 1,
                  borderRadius: 10,
                  color: Get.theme.colorScheme.onSurface,
                  sideColor: Get.theme.colorScheme.primary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 5.0),
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.theme.colorScheme.onSurface,
                              border: Border.all(
                                  color: context.theme.colorScheme.primary)),
                          child: Center(
                            child: Icon(
                              Icons.email_outlined,
                              color: context.theme.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        10.marginHorizontal,
                        Text(
                          "mail@groxwise.com",
                          style: Styles.textStyle(
                              fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              10.marginVertical,
              SizedBox(
                width: Get.width,
                child: RoundedCard(
                  sideWidth: 1,
                  borderRadius: 10,
                  color: Get.theme.colorScheme.onSurface,
                  sideColor: Get.theme.colorScheme.primary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 5.0),
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.theme.colorScheme.onSurface,
                              border: Border.all(
                                  color: context.theme.colorScheme.primary)),
                          child: Center(
                            child: Icon(
                              Icons.phone,
                              color: context.theme.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        10.marginHorizontal,
                        Text(
                          "+123-456-7898727",
                          style: Styles.textStyle(
                              fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
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
