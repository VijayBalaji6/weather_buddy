import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:weather_buddy/constants/colors.dart';
import 'package:weather_buddy/modules/home/home_controller.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.appMainTheme,
        selectedLabelStyle:
            const TextStyle(color: AppColor.appMainTheme, fontSize: 12),
        unselectedItemColor: AppColor.appSecTheme,
        unselectedLabelStyle:
            const TextStyle(color: AppColor.appSecTheme, fontSize: 12),
        backgroundColor: AppColor.black,
        showUnselectedLabels: true,
        currentIndex: controller.currentDashboardPage,
        onTap: (currentSelectedPage) => controller.updateCurrentDashboardPage(
            currentSelectedView: currentSelectedPage),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.cloud_sharp), label: ""),
        ],
      );
    });
  }
}
