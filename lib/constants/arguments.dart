
import 'package:flutter/material.dart';

class SettingArgument{
  final Map<dynamic, dynamic> temperature;
  final Map<dynamic, dynamic>  wind;
  final Map<dynamic, dynamic> pressure;
  SettingArgument({required this.temperature, required this.wind, required this.pressure});
}
class ListSavedAreaArgument{
  final Color colorImage;
  ListSavedAreaArgument({required this.colorImage});
}