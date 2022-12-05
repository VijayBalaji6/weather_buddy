import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonUtils {

  static getSnackBar({String? title, String? message}) {
    return Get.snackbar(
      title!,
      message!,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.black
      );
  }

  static getChangeTheme(){
    Get.changeTheme(
      Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
    );
  }
}
