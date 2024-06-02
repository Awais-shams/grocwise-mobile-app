import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/src/utils/extensions.dart';
import 'package:grocery_app/src/utils/styles.dart';
import 'package:grocery_app/src/widgets/circular_button.dart';
import 'package:sizer/sizer.dart';

class DialogNoInternet extends StatelessWidget {
  const DialogNoInternet({super.key, this.message, this.icon});

  final String? message;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(maxWidth: 80.w, maxHeight: 80.h, minWidth: 80.w),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.primary,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Icon(icon ?? Icons.wifi_tethering_error_rounded_sharp,
                color: context.theme.colorScheme.error, size: 55),
            5.marginVertical,
            Text(
              message ?? '',
              style:
                  Styles.customStyle(textSize: TextSize.SMALL, secondary: true),
              textAlign: TextAlign.center,
            ),
            15.marginVertical,
            CircularButton(
              title: "ok".tr,
              rectangle: true,
              elevation: 0,
              borderRadius: 5,
              titleStyle: Styles.customStyle(textSize: TextSize.SMALL),
              padding: const EdgeInsets.symmetric(horizontal: 40),
              height: 32,
              onTap: () => Get.back(),
            ),
          ],
        ),
      ),
    );
  }
}
