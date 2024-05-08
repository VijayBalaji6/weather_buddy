import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), (() async {
      Get.offNamed(AppRoutes.homeScreen);
    }));
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
