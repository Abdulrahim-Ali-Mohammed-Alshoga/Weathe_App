import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextSettingWidget extends StatelessWidget {
  TextSettingWidget(
      {Key? key,
      required this.fontSizeOne,
      required this.fontSizeTwo,
        required this.isWhite,
      required this.isSelectedTemperature,
      required this.temperature})
      : super(key: key);
  String isSelectedTemperature;
  num temperature;
  bool isWhite;
  int fontSizeOne, fontSizeTwo;

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: isSelectedTemperature == "F"
                ? "${double.parse("${(temperature - 273) * 9 / 5 + 32}").toInt()}"
                : "${double.parse("${temperature - 273}").toInt()}",
            style: TextStyle(
                color: isWhite?const Color(0xffffffff):Theme.of(context).textTheme.bodyText1!.color,
                fontSize: fontSizeOne.sp,
                fontWeight: FontWeight.bold)),
        TextSpan(
            text: isSelectedTemperature == "F"
                ? "°F"
                : "°C",
            style: TextStyle(
                color:isWhite?const Color(0xffffffff): Theme.of(context).textTheme.bodyText1!.color,
                fontSize: fontSizeTwo.sp,
                fontWeight: FontWeight.bold))
      ]),
    );
  }
}
