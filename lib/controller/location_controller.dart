import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/utils/utils.dart';

class LocationController extends GetxController {
  bool hasLocationPermission = false;

  LocationPermission? locationPermission;

  checkLocServEnable() async {
    locationPermission = await Geolocator.checkPermission();

    hasLocationPermission = await Geolocator.isLocationServiceEnabled();

    print("111 $locationPermission");

    if (hasLocationPermission) {
      log("User has Location Permission $hasLocationPermission");
      CommonUtils.getSnackBar(title: "Location Permission", message: "Location Permission accessed");
    } else {
      log("User has no Location Permission $hasLocationPermission");
      CommonUtils.getSnackBar(title: "Location Permission", message: "Location Permission denied");
      await Geolocator.requestPermission();
    }
    update();
  }

checkLocationPermission()async{

  hasLocationPermission = await Geolocator.isLocationServiceEnabled();
  if (!hasLocationPermission) {
    return Future.error('Location services are disabled.');
  }

  locationPermission = await Geolocator.checkPermission();
  if (locationPermission == LocationPermission.denied) {
    locationPermission = await Geolocator.requestPermission();
  if (locationPermission == LocationPermission.denied) {
  return Future.error('Location permissions are denied');
  }
  }
}




  @override
  void onInit() {
    checkLocServEnable();
    // TODO: implement onInit
    super.onInit();
  }
}
