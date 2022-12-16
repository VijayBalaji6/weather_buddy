import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_buddy/controller/location_controller.dart';
import 'package:weather_buddy/views/home_page.dart';
import 'package:weather_buddy/views/permission_request_page.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final LocationController _locationController = Get.find();

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), (() async {
      if (_locationController.locationPermission != LocationPermission.always) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const PermissionRequestPage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    }));
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/animations/weather.json"),
      ),
    );
  }
}
