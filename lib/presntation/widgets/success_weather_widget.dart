import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:weather_app/constants/colorShadow.dart';
import 'package:weather_app/data/models/fived_day_weather_data.dart';
import 'package:weather_app/presntation/widgets/my_custom_clipper.dart';
import 'package:weather_app/presntation/widgets/text_setting_widget.dart';
import 'package:weather_app/presntation/widgets/weather_unit_calculator.dart';

import '../../bussness_logc/cubit/city_weather/five_day_weather_cubit.dart';
import '../../constants/arguments.dart';
import '../../constants/hive_name.dart';
import '../../constants/name_pages.dart';
import '../../data/models/hive_models/setting_hive.dart';
import '../../data/repository/repository_hive/current_location_repository.dart';
import 'five_day_list_widget.dart';
import 'information_weather_widget.dart';
import 'my_box_shadow_painter.dart';

class SuccessWeatherWidget extends StatefulWidget {
  FiveDayWeatherData fiveDayWeatherData;

  SuccessWeatherWidget({Key? key, required this.fiveDayWeatherData})
      : super(key: key);

  @override
  State<SuccessWeatherWidget> createState() => _SuccessWeatherWidgetState();
}

class _SuccessWeatherWidgetState extends State<SuccessWeatherWidget> {
  late CityWeather cityWeather;
  late SettingHive isSelectedTemperature;

  late String nameCity;
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
    print(54445965);
    cityWeather = widget.fiveDayWeatherData.cityWeather[0]!;
    nameCity = widget.fiveDayWeatherData.city.name;
    colorShadow = ColorShadow.getColorShadow(
        cityWeather.icon.substring(0, cityWeather.icon.length - 1));

    return Container(
      //color: Colors.white,
      height: double.infinity,
      width: double.infinity,
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
                                  nameCity: nameCity,
                                  typeUnit: isSelectedTemperature.typeSetting,
                                  cityWeather: cityWeather,
                                  colorImage: colorShadow));
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
                                    if(nameCity.toLowerCase().trim()!=CurrentLocationRepository.getCurrentLocation().toLowerCase().trim()){
                                      print(nameCity.toLowerCase());
                                      print(CurrentLocationRepository.getCurrentLocation().toLowerCase());
                                      BlocProvider.of<FiveDayWeatherCubit>(context)
                                          .getCityWeather(CurrentLocationRepository.getCurrentLocation());
                                    }

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
                  child: Text(nameCity,
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
            padding: const EdgeInsets.only(top: 5),
            child: Center(
                child: TextSettingWidget(
              unitCalculator: TemperatureCalculator(
                  measurementUnit: isSelectedTemperature.typeSetting,
                  numberUnit: cityWeather.temperature),
              measurementUnit: isSelectedTemperature.typeSetting,
              fontSizeOne: 50,
              isWhite: false,
              fontSizeTwo: 35,
            )),
          ),
          Center(
            child: Text(cityWeather.description,
                style:
                    TextStyle(fontSize: 26.sp, fontWeight: FontWeight.normal)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.h, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InformationWeatherWidget(
                    image: "assets/images/windspeed1.png",
                    unitCalculator: WindCalculator(
                        measurementUnit: isSelectedWind.typeSetting,
                        numberUnit: cityWeather.windSpeed),
                    measurementUnit: isSelectedWind.typeSetting,
                    colorShadow: colorShadow),
                InformationWeatherWidget(
                    image: "assets/images/pressure1.png",
                    unitCalculator: PressureCalculator(
                        measurementUnit: isSelectedPressure.typeSetting,
                        numberUnit: cityWeather.pressure),
                    measurementUnit: isSelectedPressure.typeSetting,
                    colorShadow: colorShadow),
                InformationWeatherWidget(
                  image: "assets/images/humidity12.png",
                  unitCalculator: HumidityCalculator(
                      numberUnit: cityWeather.humidity, measurementUnit: "%"),
                  measurementUnit: "%",
                  colorShadow: colorShadow,
                )
              ],
            ),
          ),
          FiveDayListWidget(
            colorShadow: colorShadow,
            cityWeather: widget.fiveDayWeatherData.cityWeather.cast(),
            isSelectedPressure: isSelectedPressure.typeSetting,
            isSelectedWind: isSelectedWind.typeSetting,
            isSelectedTemperature: isSelectedTemperature.typeSetting,
          )
        ],
      ),
    );
  }
}
