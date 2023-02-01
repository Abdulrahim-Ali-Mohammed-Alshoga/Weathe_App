import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/data/models/fived_day_weather_data.dart';
import 'package:weather_app/data/repository/five_day_weather_repository.dart';

import 'five_day_weather_state.dart';

class FiveDayWeatherCubit extends Cubit<FiveDayWeatherState>{
  FiveDayWeatherCubit(this.fiveDayWeatherRepository):super(FiveDayWeatherInitialState());
  FiveDayWeatherRepository fiveDayWeatherRepository;
 late FiveDayWeatherData fiveDayWeatherData;
  getCityWeather(String nameCity)async {

    emit(FiveDayWeatherLoading());
    try {
  fiveDayWeatherData=await fiveDayWeatherRepository.getFiveDayWeatherData(nameCity);
  print(fiveDayWeatherData);
      emit(FiveDayWeatherSuccess());
    } catch (e) {
      print(e);
      emit(FiveDayWeatherFailure());
    }
  }
}