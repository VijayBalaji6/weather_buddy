import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/constants/theme.dart';
import 'package:weather_buddy/modules/home/home_binding.dart';
import 'package:weather_buddy/modules/splash/splash_screen.dart';
import 'package:weather_buddy/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeColor().themeData,
      home: const SplashScreen(),
      initialBinding: HomeBinding(),
      getPages: AppPages.pages,
    );
  }
}
