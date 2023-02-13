import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextSettingWidget extends StatelessWidget {
  TextSettingWidget(
      {Key? key,
      required this.fontSizeOne,
      required this.fontSizeTwo,
      required this.isWhite,
      required this.typeUnit,
      required this.measurementUnit,
      required this.numberUnit})
      : super(key: key);
  String measurementUnit, typeUnit;
  num numberUnit;
  bool isWhite;
  int fontSizeOne, fontSizeTwo;

  @override
  Widget build(BuildContext context) {

    return RichText(
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: typeUnit == "temperature"
                ? measurementUnit == "F"
                    ? "${double.parse("${(numberUnit - 273) * 9 / 5 + 32}").toInt()}"
                    : "${double.parse("${numberUnit - 273}").toInt()}"
                : typeUnit == "pressure"
                    ? measurementUnit == "hPa"
                ? "$numberUnit"
                : "${(numberUnit * 0.75).toInt()}"
                    : typeUnit == "wind"? measurementUnit == "m/s"
                        ? "$numberUnit"
                        : "${(numberUnit * 3.6).toInt()}":"$numberUnit",
            style: TextStyle(
                color: isWhite
                    ? const Color(0xffffffff)
                    : Theme.of(context).textTheme.bodyText1!.color,
                fontSize: fontSizeOne.sp,
                fontWeight: FontWeight.bold)),
        TextSpan(
            text: typeUnit == "temperature"
                ? measurementUnit == "F"
                    ? "°F"
                    : "°C"
                : typeUnit == "pressure"
                    ? measurementUnit == "hPa"
                        ? "hPa"
                        : "mmHg"
                    : typeUnit == "wind"? measurementUnit == "m/s"
                        ? "m/s"
                        : "Km/h":"%",
            style: TextStyle(
                color: isWhite
                    ? const Color(0xffffffff)
                    : Theme.of(context).textTheme.bodyText1!.color,
                fontSize: fontSizeTwo.sp,
                fontWeight: FontWeight.bold))
      ]),
    );
  }
}
