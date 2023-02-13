import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import 'package:weather_app/constants/name_pages.dart';
import 'package:weather_app/data/models/fived_day_weather_data.dart';
import 'package:weather_app/data/models/hive_models/setting_hive.dart';
import 'package:weather_app/presntation/widgets/my_custom_clipper.dart';

import '../../bussness_logc/cubit/city_weather/five_day_weather_cubit.dart';
import '../../bussness_logc/cubit/city_weather/five_day_weather_state.dart';
import '../../constants/arguments.dart';
import '../../constants/hive_name.dart';
import '../widgets/information_weather_widget.dart';
import '../widgets/my_box_shadow_painter.dart';
import '../widgets/success_weather_widget.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late FiveDayWeatherData fiveDayWeatherData;

  DateTime date = DateTime.now();
 FirebaseMessaging fbm=FirebaseMessaging.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  fbm.getToken().then((value) => print(value));
    BlocProvider.of<FiveDayWeatherCubit>(context).getCityWeather("Tokyo");
  }

  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      body: BlocBuilder<FiveDayWeatherCubit, FiveDayWeatherState>(
        builder: (context, state) {
          if (state is FiveDayWeatherSuccess) {
            fiveDayWeatherData = BlocProvider.of<FiveDayWeatherCubit>(context)
                .fiveDayWeatherData;

            return SuccessWeatherWidget(
              fiveDayWeatherData: fiveDayWeatherData,
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
                        onTap: () {},
                        child: const Icon(
                          Icons.settings_outlined,
                          size: 25,
                        ),
                      )
                    ],
                  ),
                ),
                CustomPaint(
                  painter: MyBoxShadowPainter(colorShadow: Color(0xff456578)),
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
