import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:grocery_app/src/navigation/routes.dart';
import 'package:grocery_app/src/ui/splash/splash.dart';
import 'package:grocery_app/src/utils/colors.dart';
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
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.PRIMARY_COLOR),
            useMaterial3: true,
          ),
          initialRoute: Routes.splashRoute,
          getPages: [
            GetPage(name: Routes.splashRoute, page: () => const SplashPage()),
          ],
        );
      },
    );
  }
}
