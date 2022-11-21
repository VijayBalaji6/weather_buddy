import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/Models/weather_data_model.dart';
import 'package:weather_buddy/controller/location_controller.dart';
import 'package:weather_buddy/views/splash_screen.dart';

import 'views/home_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final String title = 'Weather Buddy';

  LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen()
    );
  }
}
