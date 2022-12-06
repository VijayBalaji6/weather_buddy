import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/constants/theming.dart';

class CommonUtils {
  static getSnackBar({String? title, String? message}) {
    return Get.snackbar(title!, message!,
        colorText: constWhite,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.black);
  }

  static getChangeTheme() {
    Get.changeTheme(
      Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
    );
  }
}
