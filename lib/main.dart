import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/controller/location_controller.dart';

import 'views/home_page.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
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
      home: HomePage(
        title: title,
      ),
    );
  }
}
