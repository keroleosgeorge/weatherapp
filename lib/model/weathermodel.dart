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
    switch (weatherStateName) {
      case 'Sunny':
      case 'Clear':
        return Colors.orange; // طقس مشمس وصافٍ
      case 'Partly Cloudy':
        return Colors.lightBlue; // طقس غائم جزئيًا
      case 'Cloudy':
        return Colors.blueGrey; // طقس غائم
      case 'Overcast':
        return Colors.grey; // طقس ملبد بالغيوم
      case 'Mist':
        return Colors.green; // طقس ضبابي
      case 'Patchy rain possible':
      case 'Patchy rain nearby':
        return Colors.blue; // احتمال أمطار خفيفة
      case 'Patchy snow possible':
        return Colors.cyan; // احتمال تساقط ثلوج خفيفة
      case 'Patchy sleet possible':
        return Colors.teal; // احتمال سقوط برد
      case 'Patchy freezing drizzle possible':
        return Colors.blue; // احتمال رذاذ متجمد خفيف
      case 'Thundery outbreaks possible':
        return Colors.deepPurple; // احتمال عواصف رعدية
      case 'Blowing snow':
        return Colors.cyan; // عواصف ثلجية
      case 'Blizzard':
        return Colors.indigo; // عاصفة ثلجية قوية
      case 'Fog':
        return Colors.grey; // ضباب
      case 'Freezing fog':
        return Colors.blueGrey; // ضباب متجمد
      case 'Patchy light drizzle':
        return Colors.lightBlue; // رذاذ خفيف متقطع
      case 'Light drizzle':
        return Colors.blue; // رذاذ خفيف
      case 'Freezing drizzle':
        return Colors.lightBlue; // رذاذ متجمد
      case 'Heavy freezing drizzle':
        return Colors.indigo; // رذاذ متجمد كثيف
      case 'Patchy light rain':
        return Colors.blue; // أمطار خفيفة متقطعة
      case 'Light rain':
        return Colors.blue; // أمطار خفيفة
      case 'Moderate rain at times':
      case 'Moderate rain':
        return Colors.blue; // أمطار متوسطة
      case 'Heavy rain at times':
      case 'Heavy rain':
        return Colors.indigo; // أمطار غزيرة
      case 'Light freezing rain':
        return Colors.blue; // أمطار متجمدة خفيفة
      case 'Moderate or heavy freezing rain':
        return Colors.deepPurple; // أمطار متجمدة متوسطة أو غزيرة
      case 'Light sleet':
      case 'Moderate or heavy sleet':
        return Colors.teal; // برد خفيف إلى متوسط
      case 'Patchy light snow':
        return Colors.cyan; // ثلوج خفيفة متقطعة
      case 'Light snow':
        return Colors.blue; // ثلوج خفيفة
      case 'Patchy moderate snow':
        return Colors.cyan; // ثلوج متوسطة متقطعة
      case 'Moderate snow':
        return Colors.blue; // ثلوج متوسطة
      case 'Patchy heavy snow':
      case 'Heavy snow':
        return Colors.indigo; // ثلوج غزيرة
      case 'Ice pellets':
        return Colors.teal; // حبيبات جليدية
      case 'Light rain shower':
        return Colors.blue; // زخات أمطار خفيفة
      case 'Moderate or heavy rain shower':
        return Colors.blue; // زخات أمطار متوسطة أو غزيرة
      case 'Torrential rain shower':
        return Colors.indigo; // زخات أمطار غزيرة جدًا
      case 'Light sleet showers':
        return Colors.teal; // زخات برد خفيفة
      case 'Moderate or heavy sleet showers':
        return Colors.teal; // زخات برد متوسطة أو غزيرة
      case 'Light snow showers':
        return Colors.cyan; // زخات ثلجية خفيفة
      case 'Moderate or heavy snow showers':
        return Colors.blue; // زخات ثلجية متوسطة أو غزيرة
      case 'Light showers of ice pellets':
        return Colors.teal; // زخات حبيبات جليدية خفيفة
      case 'Moderate or heavy showers of ice pellets':
        return Colors.teal; // زخات حبيبات جليدية متوسطة أو غزيرة
      case 'Patchy light rain with thunder':
        return Colors.purple; // أمطار خفيفة مع رعد
      case 'Moderate or heavy rain with thunder':
        return Colors.deepPurple; // أمطار متوسطة أو غزيرة مع رعد
      case 'Patchy light snow with thunder':
        return Colors.cyan; // ثلوج خفيفة مع رعد
      case 'Moderate or heavy snow with thunder':
        return Colors.indigo; // ثلوج متوسطة أو غزيرة مع رعد
      default:
        return Colors.orange; // الحالة الافتراضية إذا لم يتم التعرف على حالة الطقس
    }
  }

  @override
  String toString() {
    return 'WeatherModel{cityName: $cityName, countryName: $countryName, date: $date, Temp: $Temp, MaxTemp: $MaxTemp, MinTemp: $MinTemp, weatherStateName: $weatherStateName, icon: $icon}';
  }
}
