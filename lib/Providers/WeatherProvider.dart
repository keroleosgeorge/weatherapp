import 'package:flutter/cupertino.dart';

import '../model/weathermodel.dart';

class   WeatherProvider extends ChangeNotifier {

  WeatherModel? weatherData;


  set WeatherData(WeatherModel? weather) {
    weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get WeatherData => weatherData;
}