import 'package:hive/hive.dart';

part 'setting_hive.g.dart';

@HiveType(typeId: 0)
class SettingHive extends HiveObject {
  @HiveField(0)
  late Map<dynamic, dynamic> selectSetting;
  @HiveField(1)
  late String typeSetting;

  SettingHive(this.selectSetting, this.typeSetting);
// flutter packages pub run build_runner build
}
