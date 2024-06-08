import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:grocery_app/base/base_view_model.dart';
import 'package:grocery_app/src/navigation/routes.dart';
import 'package:grocery_app/src/services/internet_service.dart';
import 'package:grocery_app/src/ui/dashboard/dashboard_view.dart';
import 'package:grocery_app/src/ui/home/home_vm.dart';
import 'package:grocery_app/src/ui/product_detail/product_detail.dart';
import 'package:grocery_app/src/ui/splash/splash.dart';
import 'package:grocery_app/src/utils/constants.dart';
import 'package:grocery_app/src/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: Constants.SUPABASE_URL, anonKey: Constants.ANON_KEY);
  await SentryFlutter.init(
    (options) {
      options.dsn = Constants.SENTRY_DNS;
      options.tracesSampleRate = 1.0;
      options.attachScreenshot = true;
      options.screenshotQuality = SentryScreenshotQuality.medium;
    },
    appRunner: () => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BaseViewModel()),
        ChangeNotifierProvider(create: (context) => HomeVM()),
      ],
      child: const MyApp(),
    )),
  );
}

final supabase = Supabase.instance.client;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    InternetService().startListening(_onInternetConnectionChanged);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    InternetService().startListening((connected) => null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'Grocwise',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          initialRoute: Routes.splashRoute,
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          getPages: [
            GetPage(name: Routes.splashRoute, page: () => const SplashPage()),
            GetPage(
                name: Routes.PRODUCT_DETAIL,
                page: () => const ProductDetailView()),
            GetPage(
                name: Routes.MAIN_SCREEN, page: () => const DashboardView()),
          ],
        );
      },
    );
  }

  _onInternetConnectionChanged(bool connected) {
    if (!connected && Get.currentRoute == Routes.MAIN_SCREEN) {
      Get.context!.read<HomeVM>().dataFailed();
    }
  }
}
