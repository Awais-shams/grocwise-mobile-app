import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/src/navigation/routes.dart';
import 'package:grocery_app/src/utils/colors.dart';
import 'package:grocery_app/src/utils/constants.dart';
import 'package:grocery_app/src/utils/extensions.dart';
import 'package:grocery_app/src/utils/utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => SplashPageContent();
}

class SplashPageContent extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Future.delayed(Constants.SPLASH_DELAY, () {
        Get.toNamed(Routes.homeRoute);
        Utils.setupSystemBarIcons(
          statusBarColor: Colors.transparent,
          navigationBarColor: Colors.black,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.PRIMARY_COLOR,
        body: SafeArea(
          child: Column(children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'Grocwise',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 31.sp,
                              fontFamily: 'Poppins',
                              height: 0.8,
                            ),
                          ),
                        ),
                        10.marginVertical,
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'Smart Grocery Shopping Assistant',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              fontFamily: 'Plus Jakarta Sans',
                              height: 0.8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
