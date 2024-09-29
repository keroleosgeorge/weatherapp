import 'package:dio/dio.dart';
import 'package:weather_app/model/weathermodel.dart';

class WeatherServices {
  Dio dio;

  WeatherServices(this.dio);

  String baseUrl = 'https://api.weatherapi.com/v1';
  String API_KEY = '970efb6276934d9e9df225710242409';

  Future<WeatherModel> getCityWeather(String cityName) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$API_KEY&q=$cityName&days=1');

      WeatherModel weather = WeatherModel.fromJson(response.data);

      print(weather);
      return weather;
    } on DioException catch (e) {
      print(e.toString());
throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
