import 'package:dio/dio.dart';
import 'package:weather_app/constants/conction.dart';

class CityWeatherWebService{
  late Dio dio;
  CityWeatherWebService(){
    BaseOptions baseOptions=BaseOptions (
      receiveTimeout: 10*1000,
      baseUrl: Conction.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 10*1000
    );
    dio=Dio(baseOptions);
  }
  Future<dynamic> getCityWeather(String nameCity) async {
    Response response = await dio.get("/weather",
        queryParameters: {"q": nameCity,"appid":Conction.key},
     );
// print(response);
    return response.data ;
  }
}