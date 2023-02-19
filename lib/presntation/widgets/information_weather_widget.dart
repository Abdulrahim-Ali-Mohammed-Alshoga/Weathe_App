import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/presntation/widgets/text_setting_widget.dart';
import 'package:weather_app/presntation/widgets/weather_unit_calculator.dart';

import '../../constants/colorShadow.dart';

class InformationWeatherWidget extends StatelessWidget {
  InformationWeatherWidget(
      {Key? key,
        required this.measurementUnit,
        required this.unitCalculator,
      required this.image,
      required this.colorShadow})
      : super(key: key);

  UnitCalculator unitCalculator;
  String image, measurementUnit;
  Color colorShadow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 105,
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            margin: EdgeInsets.only(bottom: 10.h),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: colorShadow.withOpacity(.99),
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(image, height: 60, width: 60),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextSettingWidget(
                    fontSizeOne: 20,
                    fontSizeTwo: 0,
                    isWhite: false,
                    measurementUnit: measurementUnit,
                    unitCalculator:unitCalculator ,
                    ),
                Flexible(
                  child: FittedBox(
                    child: Text(
                      measurementUnit,
                      style: TextStyle(fontSize: 13.sp),
                      maxLines: 1,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
