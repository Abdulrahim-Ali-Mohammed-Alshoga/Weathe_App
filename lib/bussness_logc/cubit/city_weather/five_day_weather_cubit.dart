import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/data/models/fived_day_weather_data.dart';
import 'package:weather_app/data/repository/five_day_weather_repository.dart';

import 'five_day_weather_state.dart';

class FiveDayWeatherCubit extends Cubit<FiveDayWeatherState> {
  FiveDayWeatherCubit(this.fiveDayWeatherRepository)
      : super(FiveDayWeatherInitialState());
  FiveDayWeatherRepository fiveDayWeatherRepository;
  late FiveDayWeatherData fiveDayWeatherData;

  getCityWeather(String nameCity) async {
    emit(FiveDayWeatherLoading());
    try {
      fiveDayWeatherData =
          await fiveDayWeatherRepository.getFiveDayWeatherData(nameCity);

      emit(FiveDayWeatherSuccess());
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        // print('catched');
        if (e.response?.statusCode == 404) {
          emit(FiveDayWeatherFailure(typeFailure: "Check the name of the Current Location"));
        } else {
          emit(FiveDayWeatherFailure(typeFailure: "catch"));
        }
        // print(e.response?.statusCode.toString());
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        //    print('check your connection');
        emit(FiveDayWeatherFailure(typeFailure: "check your connection"));
        return;
      }

      if (e.type == DioErrorType.receiveTimeout) {
        emit(FiveDayWeatherFailure(
            typeFailure: "unable to connect to the server"));
        //print('unable to connect to the server');
        return;
      }

      if (e.type == DioErrorType.other) {
        emit(FiveDayWeatherFailure(typeFailure: "Something went wrong : Make sure you are connected to the internet"));
        // print('Something went wrong');
        return;
      }
      print(e);
    } catch (e) {
      emit(FiveDayWeatherFailure(typeFailure: "Something went wrong"));
      // print(e);
    }
  }
}
