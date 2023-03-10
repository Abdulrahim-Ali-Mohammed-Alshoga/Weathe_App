import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/presntation/widgets/card_details_weather_widget.dart';

import '../widgets/weather_unit_calculator.dart';

class DetailsWeatherDay extends StatefulWidget {
  DetailsWeatherDay(
      {Key? key,
      required this.wind,
      required this.pressure,
      required this.humidity,
      required this.temperature,
      required this.nameDyeWeek,
      required this.typeUnit})
      : super(key: key);
  String nameDyeWeek;
  Map<String, String> typeUnit;
  List<num> temperature;
  List<num> wind;
  List<int> pressure;
  List<int> humidity;

  @override
  State<DetailsWeatherDay> createState() => _DetailsWeatherDayState();
}

class _DetailsWeatherDayState extends State<DetailsWeatherDay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          title: Text(widget.nameDyeWeek),
          leading: const BackButton(color: Colors.deepOrange),
        ),
        body: Column(
          children: [
            Container(
              height: 10,
            ),
            CardDetailsWeatherWidget(

                image: "assets/images/humidity12.png",
                typeWeather: "Humidity",
                unitCalculator:
                [for(var i=0;i<widget.wind.length;i++)PressureCalculator(
                    measurementUnit:"%",
                    numberUnit: widget.humidity[i]), ],
                measurementUnit: "%"),
            Container(
              height: 20,
            ),
            CardDetailsWeatherWidget(

                unitCalculator:[for(var i=0;i<widget.wind.length;i++)WindCalculator(
                    measurementUnit: widget.typeUnit["wind"]!,
                    numberUnit: widget.wind[i]), ],
                image: "assets/images/windspeed1.png",
                typeWeather: "Wind",
                measurementUnit: widget.typeUnit["wind"]!),
            Container(
              height: 20,
            ),
            CardDetailsWeatherWidget(
                unitCalculator:[for(var i=0;i<widget.wind.length;i++)PressureCalculator(
    measurementUnit: widget.typeUnit["pressure"]!,
    numberUnit: widget.pressure[i]), ],
                image: "assets/images/pressure1.png",
                typeWeather: "Pressure",
                measurementUnit: widget.typeUnit["pressure"]!),
          ],
        ));
  }
}
