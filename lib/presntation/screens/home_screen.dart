import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/constants/name_pages.dart';
import 'package:weather_app/data/models/fived_day_weather_data.dart';
import 'package:weather_app/presntation/widgets/my_custom_clipper.dart';
import '../../bussness_logc/cubit/city_weather/five_day_weather_cubit.dart';
import '../../bussness_logc/cubit/city_weather/five_day_weather_state.dart';
import '../widgets/my_box_shadow_painter.dart';
import '../widgets/success_weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late FiveDayWeatherData fiveDayWeatherData;

  DateTime date = DateTime.now();
  FirebaseMessaging fbm = FirebaseMessaging.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fbm.getToken().then((value) => print(value));
    BlocProvider.of<FiveDayWeatherCubit>(context).getCityWeather("Tokyo");
  }

  Widget build(BuildContext context) {
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
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.deepOrange,
              ),
            );
          }
        },
      ),
    );
  }
}
