import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/presntation/widgets/text_setting_widget.dart';
import 'package:weather_app/presntation/widgets/weather_unit_calculator.dart';

class CardDetailsWeatherWidget extends StatelessWidget {
  CardDetailsWeatherWidget(
      {Key? key,

      required this.measurementUnit,
      required this.image,
        required this.unitCalculator,
      required this.typeWeather})
      : super(key: key);
  String image, typeWeather, measurementUnit;
  List<UnitCalculator >unitCalculator;
  List<String> partsOfTheDay = ["Morning", "Day", "Evening", "Night"];

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: .5,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  image,
                  height: 40,
                  width: 40,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  typeWeather,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...List.generate(
                    unitCalculator.length,
                    (index) {
                     //  unitCalculator.measurementUnit="numberUnit[1]";
                      return
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Opacity(
                            opacity: .5,
                            child: Text(
                              partsOfTheDay[index],
                              style: TextStyle(fontSize: 16.sp),
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: TextSettingWidget(
                              isWhite: false,
                              fontSizeOne: 19,
                              unitCalculator: unitCalculator[index],
                              fontSizeTwo: 13,
                              measurementUnit: measurementUnit,

                            )),
                      ],
                    );}
             )
              ],
            )
          ],
        ),
      ),
    );
  }
}
