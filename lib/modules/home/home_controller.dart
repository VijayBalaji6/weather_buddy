import 'package:get/get.dart';

class HomeController extends GetxController {
  int currentDashboardPage = 0;

  bool isLightTheme = false;

  void changeTheme(bool currentTheme) {
    isLightTheme = currentTheme;
    update();
  }

  void updateCurrentDashboardPage({required int currentSelectedView}) {
    currentDashboardPage = currentSelectedView;
    update();
  }
}
