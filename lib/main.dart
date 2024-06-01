import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:grocery_app/src/navigation/routes.dart';
import 'package:grocery_app/src/ui/dashnoard/dashboard_view.dart';
import 'package:grocery_app/src/ui/home/home_view.dart';
import 'package:grocery_app/src/ui/splash/splash.dart';
import 'package:grocery_app/src/utils/colors.dart';
import 'package:grocery_app/src/utils/theme.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          initialRoute: Routes.splashRoute,
          getPages: [
            GetPage(name: Routes.splashRoute, page: () => const SplashPage()),
            GetPage(name: Routes.homeRoute, page: () => const HomeView()),
            GetPage(
                name: Routes.MAIN_SCREEN, page: () => const DashboardView()),
          ],
        );
      },
    );
  }
}
