import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isLightTheme = false;

  void changeTheme(bool currentTheme) {
    isLightTheme = currentTheme;
    Get.changeTheme(isLightTheme ? ThemeData.light() : ThemeData.dark());
    update();
  }
}
