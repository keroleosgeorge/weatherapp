

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weathermodel.dart';

class WeatherServices {
  String baseUrl = 'https://api.weatherapi.com/v1';
  String API_KEY = '970efb6276934d9e9df225710242409';

  Future<WeatherModel> getCityWeather(String cityName) async {

Uri url = Uri.parse(
  '$baseUrl/forecast.json?key=$API_KEY&q=$cityName&days=2'
);
http.Response response = await http.get(url);

Map<String, dynamic> data =  jsonDecode(response.body);

WeatherModel weather = WeatherModel.fromJson(data);

print(weather);
return weather;
  }
}