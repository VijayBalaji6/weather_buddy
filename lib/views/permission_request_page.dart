import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/controller/location_controller.dart';
import 'package:weather_buddy/utils/custom_appbar.dart';

import 'home_page.dart';

class PermissionRequestPage extends StatelessWidget {
  const PermissionRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      builder: (locationController) {
        return Scaffold(
          appBar: myAppBar(title: 'Permission Request', leadIconAction: () {}),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                locationController.isLocationServiceEnabled
                    ? locationController.locationPermission ==
                                LocationPermission.deniedForever ||
                            locationController.locationPermission ==
                                LocationPermission.denied
                        ? ElevatedButton(
                            onPressed: () async {
                              locationController.checkLocationPermission();
                            },
                            child: const Text("Allow to Access Location"))
                        : ElevatedButton(
                            onPressed: () async {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                            },
                            child: const Text("Go To Home"))
                    : const Text("Please Turn On Location")
              ],
            ),
          ),
        );
      },
    );
  }
}
