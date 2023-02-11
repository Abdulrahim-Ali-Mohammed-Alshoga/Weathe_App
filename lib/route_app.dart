import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/constants/arguments.dart';
import 'package:weather_app/constants/name_pages.dart';
import 'package:weather_app/data/repository/five_day_weather_repository.dart';
import 'package:weather_app/data/web_services/five_day_weather_web_service.dart';
import 'package:weather_app/presntation/screens/List_saved_areas_screen.dart';
import 'package:weather_app/presntation/screens/details_weather_day.dart';
import 'package:weather_app/presntation/screens/frist_page.dart';
import 'package:weather_app/presntation/screens/search_screen.dart';
import 'package:weather_app/presntation/screens/setting_screen.dart';

import 'animate_route.dart';
import 'bussness_logc/cubit/city_weather/five_day_weather_cubit.dart';

class RouteApp {
  FiveDayWeatherCubit cityWeatherCubit =
      FiveDayWeatherCubit(FiveDayWeatherRepository(FiveDayWeatherWebService()));

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NamePage.firstPage:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider<FiveDayWeatherCubit>(
                create: (context) => cityWeatherCubit,
                child: const FirstPage());
          },
        );
      case NamePage.settingScreen:
        SettingArgument settingArgument = settings.arguments as SettingArgument;
        return AnimateRoute(
            page: SettingScreen(
                isSelectedTemperature: settingArgument.temperature,
                isSelectedWind: settingArgument.wind,
                isSelectedPressure: settingArgument.pressure),
            rightOrleft: 1.0,
            topOrBottom: 0.0);
      case NamePage.listSavedAreas:
        ListSavedAreaArgument listSavedAreaArgument =
            settings.arguments as ListSavedAreaArgument;
        return AnimateRoute(
            page: ListSavedAreasScreen(
                nameCity: listSavedAreaArgument.nameCity,
                isSelectedTemperature: listSavedAreaArgument.typeUnit,
                cityWeather: listSavedAreaArgument.cityWeather,
                colorImage: listSavedAreaArgument.colorImage),
            rightOrleft: -1.0,
            topOrBottom: 0.0);
      case NamePage.searchScreen:
        return AnimateRoute(
            page: const SearchScreen(), rightOrleft: 0.0, topOrBottom: 0.0);
      case NamePage.detailsWeatherDay:
        DetailsWeatherDayArgument dayArgument =
            settings.arguments as DetailsWeatherDayArgument;
        return AnimateRoute(
            page: DetailsWeatherDay(
                humidity: dayArgument.humidity,
                pressure: dayArgument.pressure,
                temperature: dayArgument.temperature,
                wind: dayArgument.wind,
                nameDyeWeek: dayArgument.nameDayWeek,
                typeUnit: dayArgument.typeUnit),
            rightOrleft: 0.0,
            topOrBottom: 0.0);
    }

    return null;
  }
}
