import 'package:flutter/material.dart';
import 'package:weather_buddy/modules/home/view/home_body_view.dart';
import 'package:weather_buddy/modules/home/view/home_bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: HomeBodyView(),
      bottomNavigationBar: HomeBottomBar(),
    );
  }
}
