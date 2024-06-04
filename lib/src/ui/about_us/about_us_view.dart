import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/base/base_screen.dart';
import 'package:grocery_app/src/ui/home/home_vm.dart';

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
        child: Column(children: []),
      ),
    );
  }

  @override
  void updateKeepAlive() {}

  @override
  bool get wantKeepAlive => true;
}
