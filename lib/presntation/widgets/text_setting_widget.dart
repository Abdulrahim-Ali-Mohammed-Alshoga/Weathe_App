import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/presntation/widgets/weather_unit_calculator.dart';

 class TextSettingWidget extends StatelessWidget {
  TextSettingWidget(
      {Key? key,
      required this.fontSizeOne,
      required this.fontSizeTwo,
      required this.isWhite,

       required this.measurementUnit,
      required this.unitCalculator})
      : super(key: key);
  String measurementUnit;
  UnitCalculator unitCalculator;
  bool isWhite;
  int fontSizeOne, fontSizeTwo;

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: unitCalculator.getResulting(),
            style: TextStyle(
                color: isWhite
                    ? const Color(0xfff0f0f0)
                    : Theme.of(context).textTheme.bodyText1!.color,
                fontSize: fontSizeOne.sp,
                fontWeight: FontWeight.bold)),
        TextSpan(
            text:measurementUnit,
            style: TextStyle(
                color: isWhite
                    ? const Color(0xfff0f0f0)
                    : Theme.of(context).textTheme.bodyText1!.color,
                fontSize: fontSizeTwo.sp,
                fontWeight: FontWeight.bold))
      ]),
    );
  }
}
