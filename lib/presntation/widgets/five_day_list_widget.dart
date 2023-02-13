import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/data/models/fived_day_weather_data.dart';
import 'package:weather_app/presntation/widgets/text_setting_widget.dart';

import '../../constants/arguments.dart';
import '../../constants/name_pages.dart';

class FiveDayListWidget extends StatelessWidget {
  FiveDayListWidget(
      {Key? key,
      required this.cityWeather,
      required this.colorShadow,
      required this.isSelectedWind,
      required this.isSelectedPressure,
      required this.isSelectedTemperature})
      : super(key: key);
  Color colorShadow;
  Map<int, String> weekdayName = {
    1: "Monday",
    2: "Tuesday",
    3: "Wednesday",
    4: "Thursday",
    5: "Friday",
    6: "Saturday",
    7: "Sunday"
  };
  DateTime dateTime = DateTime.now();
  String isSelectedTemperature, isSelectedPressure, isSelectedWind;
  List<CityWeather> cityWeather;
  late List<CityWeather> fiveDay;
  late List<num> temperatureOneDay = [], windOneDay = [];
  late List<int> pressureOneDay = [], humidityOneDay = [];

  int add = 1;
  int indexUnit = 0;

  @override
  Widget build(BuildContext context) {
    print(dateTime.day);
    fiveDay = cityWeather.where((element) {
      if(add>1){
        temperatureOneDay.add(element.temperature);
        windOneDay.add(element.windSpeed);
        humidityOneDay.add(element.humidity);
        pressureOneDay.add(element.pressure);
      }
      if (element.date.substring(8, 10) ==
          DateTime(dateTime.day + add).toString().substring(2, 4)) {
        add += 1;
        return true;
      } else {

        return false;
      }
    }).toList();
    print(temperatureOneDay.length);
    return Expanded(
      child: Stack(
        // clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: colorShadow.withOpacity(.5),
            height: 80,
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            top: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              // physics: ClampingScrollPhysics(),
              //primary: false,
              //physics: const BouncingScrollPhysics(),
              // physics: const ScrollPhysics(),
              itemCount: fiveDay.length,
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, NamePage.detailsWeatherDay,
                        arguments: DetailsWeatherDayArgument(
                            wind: windOneDay.sublist(index,index+4),
                            temperature: temperatureOneDay.sublist(index,index+4),
                            humidity: humidityOneDay.sublist(index,index+4),
                            pressure: pressureOneDay.sublist(index,index+4),
                            nameDayWeek: index == 0
                                ? "Tommorow"
                                : weekdayName[DateTime(dateTime.day + index + 1)
                                        .weekday]
                                    .toString(),
                            typeUnit: {
                              "temperature": isSelectedTemperature,
                              "wind": isSelectedWind,
                              "pressure": isSelectedPressure,
                            }));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: index == 0 ? 30 : 10,
                        right: index == fiveDay.length - 1 ? 20 : 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 120,
                          width: 110,
                          decoration: BoxDecoration(
                              color: colorShadow.withOpacity(.99),
                              borderRadius: BorderRadius.circular(10)),
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                top: 5,
                                //right: 0,
                                //left: 20,
                                child: Image.asset(
                                  "assets/images/${fiveDay[index].icon.substring(0, fiveDay[index].icon.length - 1)}d.png",
                                  height: 50.h,
                                  width: 50.w,
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                child: TextSettingWidget(
                                  measurementUnit: isSelectedTemperature,
                                  numberUnit: fiveDay[index].temperature,
                                  typeUnit: "temperature",
                                  fontSizeOne: 40,
                                  isWhite: false,
                                  fontSizeTwo: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          index == 0
                              ? "Tommorow"
                              : weekdayName[DateTime(dateTime.day + index + 1)
                                      .weekday]
                                  .toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
