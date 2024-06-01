import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomeViewContent();
}

class HomeViewContent extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.theme.colorScheme.onSurface,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
