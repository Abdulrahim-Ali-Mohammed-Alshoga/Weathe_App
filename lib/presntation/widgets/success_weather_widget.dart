import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:weather_app/constants/colorShadow.dart';
import 'package:weather_app/data/models/city_weather.dart';
import 'package:weather_app/presntation/widgets/my_custom_clipper.dart';

import '../../constants/arguments.dart';
import '../../constants/hive_name.dart';
import '../../constants/name_pages.dart';
import '../../data/models/hive_models/setting_hive.dart';
import 'information_weather_widget.dart';
import 'my_box_shadow_painter.dart';

class SuccessWeatherWidget extends StatefulWidget {
  CityWeather cityWeather;

  SuccessWeatherWidget({Key? key, required this.cityWeather}) : super(key: key);

  @override
  State<SuccessWeatherWidget> createState() => _SuccessWeatherWidgetState();
}

class _SuccessWeatherWidgetState extends State<SuccessWeatherWidget> {
  late CityWeather cityWeather;
  late SettingHive isSelectedTemperature;
  late SettingHive isSelectedWind;

  late SettingHive isSelectedPressure;
  late Color colorShadow;
  var box = Hive.box<SettingHive>(HiveName.settingBD);

  specifiesUnitMeasure() {
    isSelectedTemperature = box.get(HiveName.temperatureSettingBD) ??
        SettingHive({'C': false, "F": true}, "F");
    isSelectedPressure = box.get(HiveName.pressureSettingBD) ??
        SettingHive({'mmHg': false, "hPa": true}, "hpa");
    isSelectedWind = box.get(HiveName.windSettingBD) ??
        SettingHive({'m/s': true, "km/h": false}, "m/s");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    specifiesUnitMeasure();
  }

  @override
  Widget build(BuildContext context) {
    cityWeather = widget.cityWeather;
    colorShadow = ColorShadow().getColorShadow(
        cityWeather.icon.substring(0, cityWeather.icon.length - 1));
    return Container(
      //color: Colors.white,
      color: Theme.of(context).textTheme.headline5?.color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              CustomPaint(
                painter: MyBoxShadowPainter(colorShadow: colorShadow),
                child: ClipPath(
                  clipper: MyCustomClipper(),
                  child: Container(
                    height: 370,
                    color: Theme.of(context).scaffoldBackgroundColor,
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
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, NamePage.listSavedAreas,
                              arguments: ListSavedAreaArgument(
                                  colorImage:colorShadow));
                        },
                        child: Image.asset(
                          "assets/images/menu-bar.png",
                          height: 30.h,
                          width: 30.w,
                          color: Theme.of(context).textTheme.bodyText1?.color,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(NamePage.settingScreen,
                                  arguments: SettingArgument(
                                    temperature:
                                        isSelectedTemperature.selectSetting,
                                    wind: isSelectedWind.selectSetting,
                                    pressure: isSelectedPressure.selectSetting,
                                  ))
                              .then((value) => setState(() {
                                    specifiesUnitMeasure();
                                  }));
                        },
                        child: Icon(
                          Icons.settings_outlined,
                          color: Theme.of(context).textTheme.bodyText1?.color,
                          size: 25,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 220,
                child: Center(
                  child: Text(cityWeather.nameCity,
                      style: TextStyle(
                          fontSize: 30.sp, fontWeight: FontWeight.normal)),
                ),
              ),
              Positioned(
                bottom: 185,
                child: Text("Today",
                    style: TextStyle(
                        fontSize: 20.sp, fontWeight: FontWeight.normal)),
              ),
              Positioned(
                bottom: 15,
                child: Image.asset(
                  "assets/images/${cityWeather.icon.substring(0, cityWeather.icon.length - 1)}d.png",
                  height: 140.h,
                  width: 140.w,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Center(
              child: Text(
                isSelectedTemperature.typeSetting == "F"
                    ? "${double.parse("${(cityWeather.temperature - 273) * 9 / 5 + 32}").toInt()}F"
                    : "${double.parse("${cityWeather.temperature - 273}").toInt()}C"
                        .toString(),
                style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Center(
            child: Text(cityWeather.description,
                style:
                    TextStyle(fontSize: 26.sp, fontWeight: FontWeight.normal)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InformationWeatherWidget(
                    image: "assets/images/windspeed1.png",
                    humidity: isSelectedWind.typeSetting == "m/s"
                        ? "${cityWeather.windSpeed}"
                        : "${(cityWeather.windSpeed * 3.6).toInt()}",
                    unit: isSelectedWind.typeSetting == "m/s" ? "m/s" : "Km/h",
                    colorShadow: colorShadow),
                InformationWeatherWidget(
                    image: "assets/images/pressure1.png",
                    humidity: isSelectedPressure.typeSetting == "hPa"
                        ? "${cityWeather.pressure}"
                        : "${(cityWeather.pressure * 0.75).toInt()}",
                    unit: isSelectedPressure.typeSetting == "hPa"
                        ? "hPa"
                        : "mmHg",
                    colorShadow: colorShadow),
                InformationWeatherWidget(
                  image: "assets/images/humidity12.png",
                  humidity: "${cityWeather.humidity}",
                  unit: "%",
                  colorShadow: colorShadow,
                )
              ],
            ),
          ),
          Container(
            color: Colors.deepOrange,
          ),
        ],
      ),
    );
  }
}