import 'package:flutter/material.dart';

class ColorShadow{
 static Map<String, Color> colorShadow = {
    "01": const Color(0xffff8510),
    "02": const Color(0xffc5edfe),
    "03": const Color(0xff70afea),
    "04": const Color(0xff6db1f2),
    "09": const Color(0xff91bee0),
    "10": const Color(0xfff1d16a),
    "11": const Color(0xff7197b7),
    "13": const Color(0xff0c5bc0),
    "50": const Color(0xffbdbcba)
  };
 static getColorShadow(String nameIconWeather){
    return colorShadow[nameIconWeather];
  }
}