import 'package:get/get.dart';
import 'package:weather_buddy/modules/favourite_cities/favourite_cities_controller.dart';
import 'package:weather_buddy/modules/home_city/weather_controller.dart';

class HomeController extends GetxController {
  int currentDashboardPage = 0;

  void updateCurrentDashboardPage({required int currentSelectedView}) {
    currentDashboardPage = currentSelectedView;
    update();
  }

  @override
  void onInit() {
    Get.lazyPut(() => HomeCityWeatherController());
    Get.lazyPut(() => FavoriteCitiesWeatherController());
    super.onInit();
  }
}
