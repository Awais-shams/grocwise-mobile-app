import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/base/base_screen.dart';
import 'package:grocery_app/src/services/services.dart';
import 'package:grocery_app/src/ui/home/home_view.dart';
import 'package:grocery_app/src/ui/home/home_vm.dart';
import 'package:grocery_app/src/utils/constants.dart';
import 'package:grocery_app/src/utils/utils.dart';
import 'package:grocery_app/src/widgets/bottom_nav_bar.dart';
import 'package:grocery_app/src/widgets/toolbar.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => DashboardContent();
}

final pages = [
  const HomeView(),
];

class DashboardContent extends BaseScreen<DashboardView, HomeVM>
    with AutomaticKeepAliveClientMixin {
  final PageController pageController = PageController(initialPage: 0);
  final GlobalKey<BottomNavBarState> key = GlobalKey<BottomNavBarState>();

  String screenName = "Products";

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: context.theme.colorScheme.primary,
      child: SafeArea(
        bottom: !Utils.needSaveArea(),
        child: WillPopScope(
          onWillPop: _handleBackPress,
          child: Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: false,
            backgroundColor: context.theme.colorScheme.onSurface,
            body: Column(
              children: [
                ToolBar(screenName: screenName),
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
      setState(() {
        screenName = "Products";
      });
      return false;
    }
  }

  @override
  void updateKeepAlive() {}

  @override
  bool get wantKeepAlive => true;
}
