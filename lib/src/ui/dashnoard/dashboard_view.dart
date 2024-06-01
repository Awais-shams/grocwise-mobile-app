import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/src/services/services.dart';
import 'package:grocery_app/src/ui/home/home_view.dart';
import 'package:grocery_app/src/utils/constants.dart';
import 'package:grocery_app/src/utils/dimensions.dart';
import 'package:grocery_app/src/utils/styles.dart';
import 'package:grocery_app/src/utils/utils.dart';
import 'package:grocery_app/src/widgets/bottom_nav_bar.dart';
import 'package:sizer/sizer.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => DashboardContent();
}

final pages = [
  const HomeView(),
];

class DashboardContent extends State<DashboardView> {
  final PageController pageController = PageController(initialPage: 0);
  final GlobalKey<BottomNavBarState> key = GlobalKey<BottomNavBarState>();

  String screenName = "Products";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.colorScheme.onSurface,
      child: SafeArea(
        bottom: !Utils.needSaveArea(),
        top: Utils.needSaveArea(),
        child: WillPopScope(
          onWillPop: _handleBackPress,
          child: Scaffold(
            extendBody: true,
            backgroundColor: context.theme.colorScheme.onSurface,
            body: Column(
              children: [
                Container(
                  height: Dimensions.TOOLBAR_HEIGHT,
                  width: 100.w,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(
                      Dimensions.TEXT_SIZE_HEADING,
                      Dimensions.HORIZONTAL_PADDING,
                      Dimensions.HORIZONTAL_PADDING,
                      0),
                  decoration:
                      BoxDecoration(color: context.theme.colorScheme.primary),
                  child: Text(screenName,
                      style: Styles.customStyle(
                              textSize: TextSize.HEADING,
                              textWeight: TextWeight.BOLD)
                          ?.apply(color: Colors.white)),
                ),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pageController,
                    children: pages,
                  ),
                ),
                BottomNavBar(
                    key: key,
                    onItemSelected: (m) {
                      setState(() {
                        screenName = m.title;
                      });
                      pageController.jumpToPage(m.index);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _handleBackPress() async {
    if (key.currentState?.selectBottomNav.index == Constants.HOME) {
      if (!LoaderService.isLoaderShowing) {
        return true;
      } else {
        return false;
      }
    } else {
      pageController.jumpToPage(Constants.HOME);
      key.currentState?.onSelectionChanged(Constants.HOME);
      return false;
    }
  }
}
