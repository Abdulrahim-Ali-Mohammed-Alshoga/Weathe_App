
import 'package:flutter/material.dart';
import 'package:weather_app/data/models/fived_day_weather_data.dart';

class SettingArgument{
  final Map<dynamic, dynamic> temperature;
  final Map<dynamic, dynamic>  wind;
  final Map<dynamic, dynamic> pressure;
  SettingArgument({required this.temperature, required this.wind, required this.pressure});
}
class ListSavedAreaArgument{
  final Color colorImage;
  final CityWeather cityWeather;
  final String typeUnit;
  final String nameCity;

  ListSavedAreaArgument({required this.colorImage,required this.nameCity,required this.cityWeather,required this.typeUnit});
}