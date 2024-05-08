import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/modules/home/home_controller.dart';
import 'package:weather_buddy/modules/home_city/home_cities_controller.dart';
import 'package:weather_buddy/modules/home_city/home_cities_screen.dart';
import 'package:weather_buddy/modules/settings/settings_screen.dart';
import 'package:weather_buddy/utils/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeCityWeatherController _homeCityWeatherController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(
          title: "Weather Buddy",
          leadIconAction: () {
            Get.to(const SettingsScreen());
          },
          leadIcon: Icons.settings,
          needLeadingIcon: false,
        ),
        body: GetBuilder<HomeController>(builder: (controller) {
          return SizedBox(
            height: 100.sh,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Switch.adaptive(
                          value: controller.isLightTheme,
                          onChanged: (bool isLightTheme) =>
                              controller.changeTheme(isLightTheme)),
                    ],
                  ),
                  const Expanded(child: HomeCityScreen()),
                ],
              ),
            ),
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _homeCityWeatherController.getDataFromAPI(),
          child: const Icon(Icons.cloud),
        ));
  }
}
