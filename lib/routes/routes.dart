import 'package:get/get_navigation/get_navigation.dart';
import 'package:weather_buddy/modules/home/view/home_screen.dart';
import 'package:weather_buddy/modules/settings/setting_binding.dart';
import 'package:weather_buddy/modules/settings/settings_screen.dart';
import 'package:weather_buddy/modules/splash/splash_screen.dart';
import 'package:weather_buddy/routes/app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.settingScreen,
      page: () => const SettingsScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreen(),
      binding: SettingBinding(),
    ),
  ];
}
