import 'package:weather_app/data/models/city_weather.dart';
import 'package:weather_app/data/web_services/city_weather_web_service.dart';

class CityWeatherRepository{
  CityWeatherWebService cityWeatherWebService;
  CityWeatherRepository(this.cityWeatherWebService);
  Future<CityWeather> getCityWeather(String nameCity) async {
    final cityWeathers = await cityWeatherWebService.getCityWeather(nameCity);
    return CityWeather.fromJson(cityWeathers);
  }
}