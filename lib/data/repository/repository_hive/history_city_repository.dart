import 'package:hive/hive.dart';

import '../../../constants/hive_name.dart';

class HistoryCityRepository{
  static  var box = Hive.box(HistoryCityHive.historyCityDB);
  static List<dynamic> getListCity() {
    return box.get(HistoryCityHive.listCity,defaultValue: []);
  }

  static void setListCity(String listCity) {
    List<String> allCity= getListCity().cast();
    if(!allCity.contains(listCity)){
      allCity.add(listCity);
    }

    box.put(HistoryCityHive.listCity, allCity);
  }
}