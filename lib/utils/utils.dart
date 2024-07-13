import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/constants/colors.dart';

class CommonUtils {
  static void getSnackBar({String? snackBarTitle, required String message}) {
    Get.snackbar(snackBarTitle ?? "", message,
        colorText: AppColor.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: AppColor.white);
  }

  static void getChangeTheme() {
    log("change theme called");
    Get.changeTheme(
      Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
    );
  }
}
