import 'package:hive/hive.dart';

import '../../../constants/hive_name.dart';

class CurrentLocationRepository {
static  var box = Hive.box(CurrentLocationHive.currentLocationDB);
 static String getCurrentLocation() {
    return box.get(CurrentLocationHive.city,defaultValue: "ibb");
  }

static void setCurrentLocation(String currentLocation) {
   box.put(CurrentLocationHive.city, currentLocation);
}
}