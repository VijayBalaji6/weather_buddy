import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/controller/location_controller.dart';
import 'package:weather_buddy/utils/custom_appbar.dart';
import 'package:weather_buddy/views/home_page.dart';

class PermissionRequestPage extends StatelessWidget {
  const PermissionRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      builder: (locationController) {
        return Scaffold(
          appBar: myAppBar(title: 'Permission Request'),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(locationController.hasLocationPermission
                    ? "Please Provide Location Permission"
                    : "Please Accursed Return Home"),
                locationController.hasLocationPermission
                    ? ElevatedButton(
                        onPressed: () async {
                          locationController.checkLocationPermission();
                        },
                        child: const Text("Allow to Access Location"))
                    : ElevatedButton(
                        onPressed: () async {
                          Get.offAll(const HomePage());
                        },
                        child: const Text("Return Home"))
              ],
            ),
          ),
        );
      },
    );
  }
}
