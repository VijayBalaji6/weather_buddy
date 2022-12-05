import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/controller/location_controller.dart';
import 'package:weather_buddy/views/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

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
