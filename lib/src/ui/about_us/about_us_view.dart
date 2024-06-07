import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/base/base_screen.dart';
import 'package:grocery_app/src/ui/home/home_vm.dart';
import 'package:grocery_app/src/utils/constants.dart';
import 'package:grocery_app/src/utils/dimensions.dart';
import 'package:grocery_app/src/utils/extensions.dart';
import 'package:grocery_app/src/utils/styles.dart';

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
      color: context.theme.colorScheme.onSurface,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(Constants.DEFAULT_TEXT,
                  style: Styles.textStyle(
                    fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
                    fontWeight: FontWeight.w400,
                  )),
            ),
            10.marginVertical,
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => 5.marginVertical,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: SizedBox(
                    width: 40,
                    height: 30, // Adjust width as needed
                    child: Align(
                      alignment:
                          Alignment.topLeft, // Align the number to the top left
                      child: Text(
                        '${index + 1}.',
                        style: Styles.textStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                      'Lorem Ipsum is simply dummy text of the printing and type setting lorem Ipsum.',
                      style: Styles.textStyle(
                          fontWeight: FontWeight.w400, fontSize: 11.sp)),
                );
              },
            ),
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
