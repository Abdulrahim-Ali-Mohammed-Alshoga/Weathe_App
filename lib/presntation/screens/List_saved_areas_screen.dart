import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/constants/name_pages.dart';

import '../../bussness_logc/cubit/city_weather/five_day_weather_cubit.dart';
import '../../bussness_logc/cubit/city_weather/five_day_weather_state.dart';
import '../../data/models/fived_day_weather_data.dart';
import '../../data/repository/repository_hive/current_location_repository.dart';
import '../widgets/show/my_search_delegate.dart';
import '../widgets/text_setting_widget.dart';
import '../widgets/weather_unit_calculator.dart';

class ListSavedAreasScreen extends StatefulWidget {
  Color colorImage;
  CityWeather cityWeather;
  String nameCity;

  String isSelectedTemperature;
  ListSavedAreasScreen({Key? key,

    required this.colorImage,
    required this.nameCity,
    required this.cityWeather,
    required this.isSelectedTemperature})
      : super(key: key);

  @override
  State<ListSavedAreasScreen> createState() => _ListSavedAreasScreenState();
}

class _ListSavedAreasScreenState extends State<ListSavedAreasScreen> {
  late CityWeather cityWeather;

  @override
  Widget build(BuildContext context) {
    cityWeather = widget.cityWeather;
    return BlocBuilder<FiveDayWeatherCubit, FiveDayWeatherState>(
      builder:(context, state) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "Favorites",
          ),
          leading: const BackButton(color: Colors.deepOrange),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  //Navigator.pushNamed(context, NamePage.searchScreen);
                //  BlocProvider.of<FiveDayWeatherCubit>(context).emit(FiveDayWeatherInitialState());
                  showSearch(context: context, delegate: MySearchDelegate(
                   city:BlocProvider.of<FiveDayWeatherCubit>(context)
                  ));
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.deepOrange,
                ))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
color:widget.colorImage,
                  // gradient: LinearGradient(
                  //   colors: <Color>[widget.colorImage,
                  //     widget.colorImage.withOpacity(.95),
                  //
                  //   ],
                  //   begin: FractionalOffset(0.3, 0.0),
                  //   end: FractionalOffset(0.1, -0.5),
                  //   stops: [0.0, 0.3],
                  // )
    ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  const Positioned(
                      top: 15,
                      left: 15,
                      child: Text(
                        "Current location",
                        style: TextStyle(color: Color(0xfff0f0f0), fontSize: 18),
                      )),
                  Positioned(
                      top: 45,
                      left: 15,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            CurrentLocationRepository.getCurrentLocation(),
                            style: TextStyle(
                                color: Color(0xfff0f0f0),
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/${cityWeather.icon.substring(
                                    0, cityWeather.icon.length - 1)}d.png",
                                height: 40.h,
                                width: 40.w,
                              ),
                              SizedBox(
                                width: 5.h,
                              ),
                              TextSettingWidget(
                                measurementUnit: widget.isSelectedTemperature,
                                isWhite: true,
                                unitCalculator: TemperatureCalculator(
                                    measurementUnit: widget.isSelectedTemperature,
                                    numberUnit: cityWeather.temperature
                                ),
                                fontSizeOne: 26,
                                fontSizeTwo: 26,
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h, left: 18.w),
              child: Text(
                "Favorites",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h, left: 18.w),
              child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: "Add a city, area or specific address to your ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.sp,
                      ),
                    ),
                    TextSpan(
                        text: "Favorites ",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        )),
                    TextSpan(
                        text:
                        "to quickly see what the that the weather is like there.",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.sp,
                        )),
                  ])),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h, left: 18.w),
              child: FittedBox(
                child: Text(
                  "To add Favorites. first search for them, view their forecast",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18.w),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      "and then tap",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.star_border,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
