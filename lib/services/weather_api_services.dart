import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:weather_buddy/Models/weather_data_model.dart';
import 'package:weather_buddy/constants/api_keys.dart';

class WeatherApiService extends GetxService {
  final Dio client = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseURL,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        "X-RapidAPI-Key": ApiConstants.apiKey,
        "X-RapidAPI-Host": ApiConstants.hostUrl
      },
    ),
  );

  Future<WeatherDataModel?> fetchApi(Position location) async {
    String locationData = "?q=${location.latitude}%2C${location.longitude}";
    //String query = "?q=48.8567%2C2.3508";
    try {
      var response = await client.get(locationData);

      switch (response.statusCode) {
        case 200:
          return WeatherDataModel.fromJson(json.decode(response.data));

        default:
          return null;
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }
}
