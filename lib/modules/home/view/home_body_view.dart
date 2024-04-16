import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:weather_buddy/modules/favourite_cities/favourite_cities_screen.dart';
import 'package:weather_buddy/modules/home/home_controller.dart';
import 'package:weather_buddy/modules/home_city/cities_screen.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return controller.currentDashboardPage == 0
          ? const HomeCityScreen()
          : const FavoriteCitiesScreen();
    });
  }
}
