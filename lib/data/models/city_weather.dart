class CityWeather{
  late int id;
  late String nameCity;
  late double temperature;
  late double temperatureMax;
  late double temperatureMin;
  late double windSpeed;
  late String description;
  late String icon;

  CityWeather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameCity = json['name'];
    temperature = json['main']['temp'];
    temperatureMin = json['main']['temp_min'];
    temperatureMax = json['main']['temp_max'];
    windSpeed = json['wind']['speed'];
    description = json['weather'][0]['description'];
    icon = json['weather'][0]['icon'];


  }
}