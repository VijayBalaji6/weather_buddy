import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/controller/weather_controller.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  late String title;

  HomePage({
    super.key,
    required this.title,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherController _weatherController = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: GetBuilder<WeatherController>(
        builder: (weatherController) {
        if (weatherController.weatherData != null) {
          return ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text(weatherController.weatherData!.location!.country!.toString()),
                ]);
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _weatherController.getDataFromAPI();
        },
        child: const Icon(Icons.cloud),
      ),
    );
  }
}
