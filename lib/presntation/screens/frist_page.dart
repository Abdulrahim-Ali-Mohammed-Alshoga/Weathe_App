import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:weather_app/bussness_logc/city_weather_cubit.dart';
import 'package:weather_app/bussness_logc/city_weather_state.dart';
import 'package:weather_app/constants/name_pages.dart';
import 'package:weather_app/data/models/city_weather.dart';
import 'package:weather_app/data/models/hive_models/setting_hive.dart';
import 'package:weather_app/presntation/widgets/my_custom_clipper.dart';

import '../../constants/arguments.dart';
import '../../constants/hive_name.dart';
import '../widgets/my_box_shadow_painter.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late CityWeather cityWeather;
  late SettingHive isSelectedTemperature;

  late SettingHive isSelectedWind;

  late SettingHive isSelectedPressure;
  var box = Hive.box<SettingHive>(HiveName.settingBD);
  DateTime date = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CityWeatherCubit>(context).getCityWeather("sanaa");
    isSelectedTemperature = box.get(HiveName.temperatureSettingBD,
        defaultValue: SettingHive({'C': false, "F": true}, "F"))!;
    isSelectedWind = box.get(HiveName.windSettingBD,
        defaultValue: SettingHive({'m/s': true, "km/h": false}, "m/s"))!;
    isSelectedPressure = box.get(HiveName.pressureSettingBD,
        defaultValue: SettingHive({'mmHg': true, "hPa": false}, "mmHg"))!;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CityWeatherCubit, CityWeatherState>(
        builder: (context, state) {
          if (state is CityWeatherSuccess) {
            cityWeather =
                BlocProvider.of<CityWeatherCubit>(context).cityWeather[0];
            print(cityWeather.icon);
            return Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 15.w, top: 40.h, right: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, NamePage.listSavedAreas);
                          },
                          child: Image.asset(
                            "assets/images/menu-bar.png",
                            height: 30.h,
                            width: 30.w,
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
                                      pressure:
                                          isSelectedPressure.selectSetting,
                                    ))
                                .then((value) => setState(() {
                                      isSelectedTemperature = box
                                          .get(HiveName.temperatureSettingBD)!;
                                      // isSelectedPressure = box.get(HiveName.pressureSettingBD)!;
                                      isSelectedWind =
                                          box.get(HiveName.windSettingBD)!;
                                    }));
                          },
                          child: const Icon(
                            Icons.settings_outlined,
                            size: 25,
                          ),
                        )
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    fit: StackFit.loose,
                    children: [
                      CustomPaint(
                        painter: MyBoxShadowPainter(),
                        child: ClipPath(
                          clipper: MyCustomClipper(),
                          child: Container(
                            height: 300,
                            color: Colors.white,
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
                        bottom: 220,
                        child: Center(
                          child: Text(cityWeather.nameCity,
                              style: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.normal)),
                        ),
                      ),
                      Positioned(
                        bottom: 180,
                        child: Text("Today",
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.normal)),
                      ),
                      Positioned(
                        bottom: 17,
                        child: Image.asset(
                          "assets/images/${cityWeather.icon.substring(0, cityWeather.icon.length - 1)}d.png",
                          height: 140.h,
                          width: 150.w,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isSelectedTemperature.typeSetting == "F"
                                ? double.parse(
                                        "${(cityWeather.temperature - 273) * 9 / 5 + 32}")
                                    .toInt()
                                    .toString()
                                : double.parse(
                                        "${cityWeather.temperature - 273}")
                                    .toInt()
                                    .toString(),
                            style: TextStyle(
                                fontSize: 55.sp, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )),
                  Container(
                    color: Colors.deepOrange,
                  ),
                ],
              ),
            );
          } else {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.w, top: 40.h, right: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, NamePage.listSavedAreas);
                        },
                        child: Image.asset(
                          "assets/images/menu-bar.png",
                          height: 30.h,
                          width: 30.w,
                        ),
                      ),
                      Text("cityWeather.nameCity",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(NamePage.settingScreen,
                                  arguments: SettingArgument(
                                    temperature:
                                        isSelectedTemperature.selectSetting,
                                    wind: isSelectedWind.selectSetting,
                                    pressure: isSelectedPressure.selectSetting,
                                  ));
                        },
                        child: const Icon(
                          Icons.settings_outlined,
                          size: 25,
                        ),
                      )
                    ],
                  ),
                ),
                CustomPaint(
                  painter: MyBoxShadowPainter(),
                  child: ClipPath(
                    clipper: MyCustomClipper(),
                    child: Container(
                      height: 300, color: Colors.white,
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
                Text("data")
              ],
            );
          }
        },
      ),
    );
  }
}