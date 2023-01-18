import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../constants/hive_name.dart';
import '../../data/models/hive_models/setting_hive.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen(
      {Key? key,
      required this.isSelectedTemperature,
      required this.isSelectedWind,
      required this.isSelectedPressure})
      : super(key: key);
  Map<dynamic, dynamic> isSelectedTemperature;
  Map<dynamic, dynamic> isSelectedWind;

  Map<dynamic, dynamic> isSelectedPressure;

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late int numberSelectRadio;

  var box = Hive.box<SettingHive>(HiveName.settingBD);
  var themeBox = Hive.box(HiveName.themeDB);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    numberSelectRadio=  themeBox.get(HiveName.radioSettingBD,defaultValue: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Setting", style: TextStyle(color: Colors.black)),
          elevation: 1,
          leading: const BackButton(color: Colors.deepOrange),
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.grey.shade100,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 12.w, bottom: 5.h),
                child: const Text("Units of measurement",
                    style: TextStyle(color: Colors.grey)),
              ),
              Container(
                height: 180,
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: toggleButtonsWidget(
                            "Temperature",
                            "C",
                            "F",
                            widget.isSelectedTemperature.cast(),
                            HiveName.temperatureSettingBD)),
                    Divider(height: 0.h, thickness: .5),
                    Expanded(
                        flex: 1,
                        child: toggleButtonsWidget("Wind Speed", "m/s", "km/h",
                            widget.isSelectedWind.cast(), HiveName.windSettingBD)),
                    Divider(height: 0.h, thickness: .5),
                    Expanded(
                        flex: 1,
                        child: toggleButtonsWidget(
                            "Pressure",
                            "mmHg",
                            "hPa",
                            widget.isSelectedPressure.cast(),
                            HiveName.pressureSettingBD)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 12.w, bottom: 5.h),
                child:
                    const Text("Theme", style: TextStyle(color: Colors.grey)),
              ),
              Container(
                height: 170,
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: RadioListTile<int>(
                          controlAffinity: ListTileControlAffinity.trailing,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12.w),
                          toggleable: false,
                          activeColor: Colors.deepOrange,
                          title: const Text("Light"),
                          value: 0,
                          groupValue: numberSelectRadio,
                          onChanged: (int? changed) {
                            setState(() {
                              numberSelectRadio = changed!;

                               themeBox.put(HiveName.radioSettingBD,changed );
                            });
                          }),
                    ),
                    Divider(height: 0.h, thickness: .5),
                    Expanded(
                      flex: 1,
                      child: RadioListTile<int>(
                          controlAffinity: ListTileControlAffinity.trailing,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12.w),
                          activeColor: Colors.deepOrange,
                          title: const Text("dark"),
                          value: 1,
                          groupValue: numberSelectRadio,
                          onChanged: (int? changed) {
                            setState(() {
                              numberSelectRadio = changed!;
                              themeBox.put(HiveName.radioSettingBD,changed );
                            });
                          }),
                    ),
                    Divider(height: 0.h, thickness: .5),
                    Expanded(
                      flex: 1,
                      child: RadioListTile<int>(
                          controlAffinity: ListTileControlAffinity.trailing,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12.w),
                          activeColor: Colors.deepOrange,
                          title: const Text("System"),
                          value: 2,
                          groupValue: numberSelectRadio,
                          onChanged: (int? changed) {
                            setState(() {
                              numberSelectRadio = changed!;
                              themeBox.put(HiveName.radioSettingBD,changed );
                            });
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget toggleButtonsWidget(String nameListTile, String nameButtonOne,
      String nameButtonTow, Map<String, bool> isSelect, String nameHive) {
    String selectType = "";
    return ListTile(
      title: Text(nameListTile),
      trailing: Padding(
        padding: const EdgeInsets.symmetric(vertical: 11),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(7)),
          child: ToggleButtons(
            // renderBorder: false,
            borderRadius: BorderRadius.circular(7),
            renderBorder: false,
            isSelected: isSelect.values.toList(),
            color: Colors.grey,
            splashColor: Colors.transparent,
            selectedColor: Colors.white,
            fillColor: Colors.deepOrange,
            onPressed: (index) {
              for (var i = 0; i < isSelect.length; i++) {
                if (i == index) {
                  isSelect.update(isSelect.keys.toList()[i], (value) => true);
                  selectType = isSelect.keys.toList()[i];
                } else {
                  isSelect.update(isSelect.keys.toList()[i], (value) => false);
                }
                box.put(nameHive, SettingHive(isSelect, selectType));
                print(selectType);
                setState(() {});
              }
            },
            constraints: BoxConstraints.tight(Size(75.w, 35.h)),
            children: [
              Text(nameButtonOne),
              Text(nameButtonTow),
            ],
          ),
        ),
      ),
    );
  }
}
