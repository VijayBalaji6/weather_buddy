import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_buddy/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), (() async {
      Get.toNamed(AppRoutes.homeScreen);
    }));
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/animations/weather.json"),
      ),
    );
  }
}
