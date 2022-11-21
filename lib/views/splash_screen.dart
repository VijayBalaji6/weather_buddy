import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/controller/location_controller.dart';
import 'package:weather_buddy/views/home_page.dart';
import 'package:weather_buddy/views/permission_request_page.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final LocationController _locationController = Get.find();

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5),(()async{
      if(_locationController.hasLocationPermission==true){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const PermissionRequestPage()));
      }
    }));
    return const Scaffold(
      body: Center(
        child: Text(
          "Loading....."
        ),
      ),
    );
  }
}
