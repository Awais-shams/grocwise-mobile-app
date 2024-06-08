import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/src/utils/dimensions.dart';
import 'package:grocery_app/src/utils/extensions.dart';
import 'package:grocery_app/src/utils/styles.dart';
import 'package:grocery_app/src/widgets/icon_button.dart';
import 'package:sizer/sizer.dart';

class ToolBar extends StatelessWidget {
  const ToolBar(
      {super.key, required this.screenName, this.showStartIcon = false});
  final String screenName;
  final bool showStartIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.TOOLBAR_HEIGHT,
      width: 100.w,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.fromLTRB(
          Dimensions.TEXT_SIZE_MEDIUM, 10, Dimensions.HORIZONTAL_PADDING, 5),
      decoration: BoxDecoration(color: context.theme.colorScheme.primary),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              showStartIcon == false
                  ? const SizedBox(width: 10, height: 35)
                  : Material(
                      borderRadius: BorderRadius.circular(12),
                      color: context.theme.colorScheme.primary,
                      child: CustomIconButton(
                        radius: BorderRadius.circular(25),
                        size: const Size.fromRadius(25),
                        onTap: () => Get.back(),
                        widget: Icon(
                          Icons.arrow_back,
                          color: context.theme.colorScheme.onSurface,
                          size: Dimensions.TOOLBAR_ICON_SIZE,
                        ),
                      ),
                    ),
              showStartIcon ? 20.marginHorizontal : Container(),
              Expanded(
                child: Text(screenName,
                    style: Styles.customStyle(
                            textSize: TextSize.HEADING,
                            textWeight: TextWeight.BOLD)
                        ?.apply(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
