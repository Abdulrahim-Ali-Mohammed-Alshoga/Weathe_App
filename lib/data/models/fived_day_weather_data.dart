class FiveDayWeatherData {

 late List<dynamic> cityWeather;
 late City city;
 FiveDayWeatherData.fromJson(Map<String, dynamic> json) {
    city = City.fromJson(json['city']);
   cityWeather=json['list'].map((cityWeather) => CityWeather.fromJson(cityWeather)).toList();

//cityWeather.add(CityWeather.fromJson(json['list']));
  }}
class CityWeather {
 late num temperature;
  late num windSpeed;

  late int humidity;
  late int pressure;
  late String description;
  late String icon;
  late String date;

  CityWeather.fromJson(Map<String, dynamic> json) {

    temperature = json['main']['temp'];

    pressure = json['main']['pressure'];
    humidity = json['main']['humidity'];
    windSpeed = json['wind']['speed'];
    description = json['weather'][0]['description'];
    icon = json['weather'][0]['icon'];
    date = json['dt_txt'];
  }
}
class City {
 late int id;
 late String name;


  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }}
