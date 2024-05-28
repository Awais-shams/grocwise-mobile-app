import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => SplashPageContent();
}

class SplashPageContent extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.h,
      color: Colors.amber,
    );
  }
}
