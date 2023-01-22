class CityWeather{
  late int id;
  late String nameCity;
  late double temperature;
  late double windSpeed;
  late int humidity;
  late int pressure;
  late String description;
  late String icon;

  CityWeather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameCity = json['name'];
    temperature = json['main']['temp'];
    pressure = json['main']['pressure'];
    humidity = json['main']['humidity'];
    windSpeed = json['wind']['speed'];
    description = json['weather'][0]['description'];
    icon = json['weather'][0]['icon'];


  }
}