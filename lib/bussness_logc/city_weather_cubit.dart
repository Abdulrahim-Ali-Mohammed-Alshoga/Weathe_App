import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bussness_logc/city_weather_state.dart';
import 'package:weather_app/data/models/city_weather.dart';
import 'package:weather_app/data/repository/city_weather_repository.dart';

class CityWeatherCubit extends Cubit<CityWeatherState>{
  CityWeatherCubit(this.cityWeatherRepository):super(CityWeatherInitialState());
  CityWeatherRepository cityWeatherRepository;
 List<CityWeather> cityWeather=[];
  getCityWeather(String nameCity)async {

    emit(CityWeatherLoading());
    try {
  cityWeather.add(await cityWeatherRepository.getCityWeather(nameCity));
      emit(CityWeatherSuccess());
    } catch (e) {
      emit(CityWeatherFailure());
    }
  }
}