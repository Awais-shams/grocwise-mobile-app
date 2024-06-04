import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/base/base_screen.dart';
import 'package:grocery_app/src/ui/home/home_vm.dart';
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
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.separated(
            separatorBuilder: (context, index) => 15.marginVertical,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Text(
                  '\u2022 Lorem Ipsum is simply dummy text of the printing and type setting lorem Ipsum.',
                  style: Styles.textStyle(
                    fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
                    fontWeight: FontWeight.w400,
                  ));
            },
          )),
    );
  }

  @override
  void updateKeepAlive() {}

  @override
  bool get wantKeepAlive => true;
}
