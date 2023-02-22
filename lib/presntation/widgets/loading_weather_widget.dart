import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'information_weather_widget.dart';
import 'my_box_shadow_painter.dart';
import 'my_custom_clipper.dart';

class LoadingWeatherWidget extends StatelessWidget {
  LoadingWeatherWidget({Key? key}) : super(key: key);
  List<String> image = [
    "assets/images/windspeed1.png",
    "assets/images/pressure1.png",
    "assets/images/humidity12.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white,
      height: double.infinity,
      width: double.infinity,
      color: Theme
          .of(context)
          .textTheme
          .headline5
          ?.color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              CustomPaint(
                painter: MyBoxShadowPainter(colorShadow: Colors.white),
                child: ClipPath(
                  clipper: MyCustomClipper(),
                  child: Container(
                    height: 370,
                    color: Theme
                        .of(context)
                        .scaffoldBackgroundColor,
                    // decoration: BoxDecoration(boxShadow: [
                    //   BoxShadow(
                    //       color: Colors.deepOrange,
                    //       blurRadius: 50,
                    //
                    //       spreadRadius: 50,
                    //       offset: Offset(-55.0, -30.0.h))
                    // ]),
                    // clipBehavior: Clip.antiAliasWithSaveLayer,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w, top: 40.h, right: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/menu-bar.png",
                        height: 30.h,
                        width: 30.w,
                        color: Theme
                            .of(context)
                            .textTheme
                            .bodyText1
                            ?.color,
                      ),
                      Icon(
                        Icons.settings_outlined,
                        color: Theme
                            .of(context)
                            .textTheme
                            .bodyText1
                            ?.color,
                        size: 25,
                      )
                    ],
                  ),
                ),
              ),
              const Positioned(
                  bottom: 15,
                  child: CircularProgressIndicator(
                    color: Colors.deepOrange,
                  )
              ),
            ],
          ),

      Expanded(
        child: Stack(
          // clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              color: Color(0xfff0f0f0),
              height: 80,
            ),]
      )
    ),
          ],
        ),

          // FiveDayListWidget(
          //   colorShadow: colorShadow,
          //   cityWeather: widget.fiveDayWeatherData.cityWeather.cast(),
          //   isSelectedPressure: isSelectedPressure.typeSetting,
          //   isSelectedWind: isSelectedWind.typeSetting,
          //   isSelectedTemperature: isSelectedTemperature.typeSetting,
          // )

      );
  }
}
