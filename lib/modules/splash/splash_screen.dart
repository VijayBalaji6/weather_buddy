import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_buddy/modules/cities/controller/weather_controller.dart';
import 'package:weather_buddy/modules/cities/view/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put((WeatherController()));
    Future.delayed(const Duration(seconds: 3), (() async {
      Get.to(const CitiesScreen());
    }));
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/animations/weather.json"),
      ),
    );
  }
}
