import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/controller/location_controller.dart';
import 'package:weather_buddy/utils/custom_appbar.dart';

class PermissionRequestPage extends StatelessWidget {
  const PermissionRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      builder: (locationController){
        return Scaffold(
          appBar: myAppBar(title: 'Permission Request'),
          body:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                    "Please Provide Location Permission"
                ),
                TextButton(
                    onPressed: ()async {
                      print("123");
                      await locationController.checkLocationPermission();
                    }, child: const Text("Enable Location"))
              ],
            ),
        );
      },
    );
  }
}
