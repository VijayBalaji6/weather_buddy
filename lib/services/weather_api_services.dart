import 'dart:convert';
import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'package:weather_buddy/constants/api_keys.dart';
import 'package:weather_buddy/Models/weather_data_model.dart';

class WeatherApiService {
  var client = http.Client();

  Future<WeatherDataModel?> fetchApi(Position location) async {
    String locationData = "?q=${location.latitude}%2C${location.longitude}";
    //String query = "?q=48.8567%2C2.3508";
    try {
      var response =
          await client.get(Uri.parse(baseURL + locationData), headers: header);
      print(response);
      switch (response.statusCode) {
        case 200:
          return WeatherDataModel.fromJson(json.decode(response.body));

        default:
          return null;
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }
}
