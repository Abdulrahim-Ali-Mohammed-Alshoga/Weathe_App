import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:weather_app/bussness_logc/cubit/theme/theme_cubit.dart';
import 'package:weather_app/constants/name_pages.dart';

import '../../constants/hive_name.dart';
import '../../constants/my_colors.dart';
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
  int numberSelectRadio = 0;

  var box = Hive.box<SettingHive>(HiveName.settingBD);
  var themeBox = Hive.box(HiveNameTheme.themeDB);

  changeTheme(int typeTheme) {
    BlocProvider.of<ThemeCubit>(context).changeTheme(typeTheme);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    numberSelectRadio = BlocProvider.of<ThemeCubit>(context).getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Setting"),
        elevation: 1,
        leading: const BackButton(color: Colors.deepOrange),
      ),
      body: SingleChildScrollView(
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
              color: Theme.of(context).appBarTheme.backgroundColor,
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
                      child: toggleButtonsWidget(
                          "Wind Speed",
                          "m/s",
                          "km/h",
                          widget.isSelectedWind.cast(),
                          HiveName.windSettingBD)),
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
              child: const Text("Theme", style: TextStyle(color: Colors.grey)),
            ),
            Container(
              height: 110,
              color: Theme.of(context).appBarTheme.backgroundColor,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: RadioListTile<int>(
                        controlAffinity: ListTileControlAffinity.trailing,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                        toggleable: false,
                        activeColor: Colors.deepOrange,
                        title: const Text("Light"),
                        value: 0,
                        groupValue: numberSelectRadio,
                        onChanged: (int? changed) {
                          setState(() {
                            numberSelectRadio = changed!;

                            changeTheme(0);
                          });
                        }),
                  ),
                  Divider(height: 0.h, thickness: .5),
                  Expanded(
                    flex: 1,
                    child: RadioListTile<int>(
                        controlAffinity: ListTileControlAffinity.trailing,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                        activeColor: Colors.deepOrange,
                        title: const Text("dark"),
                        value: 1,
                        groupValue: numberSelectRadio,
                        onChanged: (int? changed) {
                          setState(() {
                            numberSelectRadio = changed!;
                            changeTheme(1);
                          });
                        }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 12.w, bottom: 5.h),
              child: const Text("Current location",
                  style: TextStyle(color: Colors.grey)),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, NamePage.searchScreen);
              },
              child: Container(
                height: 74,
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                color: Theme.of(context).appBarTheme.backgroundColor,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Location",
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w400)),
                          const Icon(Icons.expand_circle_down_outlined)
                        ],
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Sanan",
                              style: TextStyle(color: Colors.grey))),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(7)),
          child: ToggleButtons(
            // renderBorder: false,
            borderRadius: BorderRadius.circular(7),
            color: Colors.grey,
            splashColor: Colors.transparent,
            selectedColor: Colors.white,
            fillColor: Colors.deepOrange,
            renderBorder: false,
            isSelected: isSelect.values.toList(),
            onPressed: (index) async {
              for (var i = 0; i < isSelect.length; i++) {
                if (i == index) {
                  isSelect.update(isSelect.keys.toList()[i], (value) => true);
                  selectType = isSelect.keys.toList()[i];
                } else {
                  isSelect.update(isSelect.keys.toList()[i], (value) => false);
                }
                await box.put(nameHive, SettingHive(isSelect, selectType));
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
