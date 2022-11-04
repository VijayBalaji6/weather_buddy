import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/utils/utils.dart';

class LocationController extends GetxController {
  bool hasLocationPermission = false;

  checkLocServEnable() async {
    hasLocationPermission = await Geolocator.isLocationServiceEnabled();

    if (hasLocationPermission) {
      log("User has Location Permission $hasLocationPermission");
      CommonUtills.getSnackBar(title: "Location Permission", message: "Location Permisson accessed");
    } else {
      log("User has Location Permission $hasLocationPermission");
      CommonUtills.getSnackBar(title: "Location Permission", message: "Location Permisson denied");
    }
    return hasLocationPermission;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkLocServEnable();
  }
}
