import 'package:get/get.dart';

class CommonUtills {

  static getSnackBar({String? title, String? message}) {
    return Get.snackbar(
      title!,
      message!,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3)
      );
  }

}
