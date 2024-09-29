import 'package:flutter/material.dart';

class WeatherModel {
  String cityName;
  String countryName;
  DateTime date;
  double Temp;
  double MaxTemp;
  double MinTemp;
  String weatherStateName;
  String icon; // Change from Uri to String

  WeatherModel({
    required this.cityName,
    required this.countryName,
    required this.date,
    required this.Temp,
    required this.MaxTemp,
    required this.MinTemp,
    required this.weatherStateName,
    required this.icon,
  });

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
      cityName: data['location']['name'],
      countryName: data['location']['country'],
      date: DateTime.parse(data['current']['last_updated']),
      Temp: jsonData['avgtemp_c'],
      MaxTemp: jsonData['maxtemp_c'],
      MinTemp: jsonData['mintemp_c'],
      weatherStateName: jsonData['condition']['text'],
      icon: "https:${jsonData['condition']['icon']}", // Ensure correct URL format
    );
  }

MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Haze' || weatherStateName == 'Fog') {
      return Colors.grey;
    } else if (weatherStateName == 'Cloudy'||weatherStateName == 'Partly cloudy ' || weatherStateName == 'Overcast') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||  weatherStateName == 'Light snow' ||
        weatherStateName == 'Heavy Rain' || weatherStateName == 'Moderate rain' ||
        weatherStateName == 'Showers') {
      return Colors.blue;
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Squall' ||
        weatherStateName == 'Light Thunderstorm') {
      return Colors.deepPurple;
    } else if (weatherStateName == 'Snow' || weatherStateName == 'Light Snow') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Snow') {
      return Colors.indigo;
    } else if (weatherStateName == 'Light Freezing Drizzle' ||
        weatherStateName == 'Light Freezing Rain') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Freezing Drizzle' ||
        weatherStateName == 'Heavy Freezing Rain') {
      return Colors.indigo;
    } else if (weatherStateName == 'Blowing Snow') {
      return Colors.blue;
    }
    return Colors.orange;
      }
  @override
  String toString() {
    return 'WeatherModel{cityName: $cityName, countryName: $countryName, date: $date, Temp: $Temp, MaxTemp: $MaxTemp, MinTemp: $MinTemp, weatherStateName: $weatherStateName, icon: $icon}';
  }
}
