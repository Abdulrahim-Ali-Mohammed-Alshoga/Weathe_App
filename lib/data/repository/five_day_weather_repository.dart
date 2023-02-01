import 'package:weather_app/data/models/fived_day_weather_data.dart';
import 'package:weather_app/data/web_services/five_day_weather_web_service.dart';

class FiveDayWeatherRepository{
  FiveDayWeatherWebService fiveDayWeatherWebService;
  FiveDayWeatherRepository(this.fiveDayWeatherWebService);
  Future<FiveDayWeatherData> getFiveDayWeatherData(String nameCity) async {
    final fiveDayData = await fiveDayWeatherWebService.getFiveDayWeatherData(nameCity);
    // print(fiveDayData);
    return FiveDayWeatherData.fromJson(fiveDayData);
  }
}
// Future<CityWeather> getCityWeather(String nameCity) async {
//   final cityWeathers = await cityWeatherWebService.getCityWeather(nameCity);
//   return CityWeather.fromJson(cityWeathers);
// }