import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:weather_app/route_app.dart';

import 'constants/hive_name.dart';
import 'data/models/hive_models/setting_hive.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized() ;
  await Hive.initFlutter();
  Hive.registerAdapter(SettingHiveAdapter());
  await Hive.openBox<SettingHive>(HiveName.settingBD);
  await Hive.openBox(HiveName.themeDB);
  runApp(MyApp(
    routeApp: RouteApp(),
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
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: routeApp.generateRoute,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        );
      },
    );
  }
}
