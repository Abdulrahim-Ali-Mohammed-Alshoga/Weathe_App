abstract class FiveDayWeatherState {}

class FiveDayWeatherInitialState extends FiveDayWeatherState {}

class FiveDayWeatherLoading extends FiveDayWeatherState {}

class FiveDayWeatherSuccess extends FiveDayWeatherState {}

class FiveDayWeatherFailure extends FiveDayWeatherState {
  String typeFailure;
  FiveDayWeatherFailure({required this.typeFailure});
}
