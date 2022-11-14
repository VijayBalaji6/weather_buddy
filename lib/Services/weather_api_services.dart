import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:weather_buddy/constants/api_keys.dart';
import 'package:weather_buddy/Models/weather_data_model.dart';

class WeatherApiService {
  var client = http.Client();

  Future<WeatherDataModel>? fetchApi({required String weatherQuery}) async {
    var response =
        await client.get(Uri.parse(baseURL + query), headers: header);

    if (response.statusCode == 200) {
      WeatherDataModel responseData =
          WeatherDataModel.fromJson(json.decode(response.body));

      log("Api Res : $responseData");

      return responseData;
    } else {
      throw Exception("failed to load API");
    }
  }
}
