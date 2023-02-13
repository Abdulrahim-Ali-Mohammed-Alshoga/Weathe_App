import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:weather_app/bussness_logc/cubit/theme/theme_cubit.dart';
import 'package:weather_app/bussness_logc/cubit/theme/theme_state.dart';
import 'package:weather_app/route_app.dart';

import 'constants/hive_name.dart';
import 'constants/theme.dart';
import 'data/models/hive_models/setting_hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp();
  Hive.registerAdapter(SettingHiveAdapter());
  await Hive.openBox<SettingHive>(HiveName.settingBD);
  await Hive.openBox(HiveNameTheme.themeDB);
  runApp(BlocProvider<ThemeCubit>(
    create: (context) => ThemeCubit()..firstAppTheme(),
    child: MyApp(
      routeApp: RouteApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.routeApp});

  RouteApp routeApp;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411.4, 843.4),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) => MaterialApp(
            title: 'Weather Live',
debugShowCheckedModeBanner: false,
         //   color:const Color(0xfff0f0f0),
            onGenerateRoute: routeApp.generateRoute,
            theme:appThemeData[state.theme],
          ),
        );
      },
    );
  }
}
