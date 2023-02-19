abstract class UnitCalculator {
  UnitCalculator({
    required this.numberUnit,
    required this.measurementUnit,
  });

  String measurementUnit;
  num numberUnit;

  String getResulting();
}

class TemperatureCalculator extends UnitCalculator {
  TemperatureCalculator({
    required num numberUnit,
    required String measurementUnit,
  }) : super(measurementUnit: measurementUnit, numberUnit: numberUnit);

  @override
  String getResulting() {
    if (measurementUnit == "F") {
      return "${double.parse("${(numberUnit - 273) * 9 / 5 + 32}").toInt()}";
    } else {
      return "${double.parse("${numberUnit - 273}").toInt()}";
    }
  }
}

class WindCalculator extends UnitCalculator {
  WindCalculator({
    required String measurementUnit,
    required num numberUnit,
  }) : super(measurementUnit: measurementUnit, numberUnit: numberUnit);

  @override
  String getResulting() {
    if (measurementUnit == "m/s") {
      return "$numberUnit";
    } else {
      return "${(numberUnit * 3.6).toInt()}";
    }
  }
}
class HumidityCalculator extends UnitCalculator {
  HumidityCalculator({
    required String measurementUnit,
    required num numberUnit,
  }) : super(measurementUnit: measurementUnit, numberUnit: numberUnit);

  @override
  String getResulting() {
    return "$numberUnit";
  }
}

class PressureCalculator extends UnitCalculator{
  PressureCalculator({
    required String measurementUnit,
    required num numberUnit,
  }):super(numberUnit: numberUnit,measurementUnit: measurementUnit);



  @override
  String getResulting() {
    if (measurementUnit =="hPa") {
      return "$numberUnit";
    } else {
      return "${(numberUnit * 0.75).toInt()}";
    }
  }
}
