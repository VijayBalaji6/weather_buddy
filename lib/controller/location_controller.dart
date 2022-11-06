import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/utils/utils.dart';

class LocationController extends GetxController {
  bool hasLocationPermission = false;

  late final LocationPermission permission;

  checkLocServEnable() async {
    hasLocationPermission = await Geolocator.isLocationServiceEnabled();

    LocationPermission permission = await Geolocator.checkPermission();

    if (hasLocationPermission) {
      log("User has Location Permission $hasLocationPermission");
      CommonUtills.getSnackBar(
          title: "Location Permission", message: "Location Permisson accessed");
    } else {
      log("User has Location Permission $hasLocationPermission");
      CommonUtills.getSnackBar(
          title: "Location Permission", message: "Location Permisson denied");
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log('Location permissions are denied');
      } else if (permission == LocationPermission.deniedForever) {
        log("'Location permissions are permanently denied");
      } else {
        log("GPS Location service is granted");
      }
    } else {
      log("GPS Location permission granted.");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkLocServEnable();
  }
}
