import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/constants/my_colors.dart';

enum AppTheme {
  darkMode,
  lightMode,
}

final appThemeData = {
  AppTheme.darkMode: ThemeData(
    scaffoldBackgroundColor: MyColors.colorScaffoldDark,
cardColor: MyColors.colorAppDark,
    radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith(
            (states) => Colors.grey.withOpacity(.3))),
    appBarTheme: const AppBarTheme(
        elevation: 0.0,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: MyColors.colorContainerDark,
        iconTheme: IconThemeData(color: Colors.white, size: 25),
        actionsIconTheme: IconThemeData(color: Colors.white, size: 25)),
    backgroundColor: const Color(0xFF191919),
    brightness: Brightness.dark,
    textTheme: const TextTheme(
        headline2: TextStyle(color: Colors.white),
        //هذا استخدام للكونتينر الذي في الاعدادات
        bodyText1: TextStyle(color: MyColors.colorImageDark),
        headline6: TextStyle(color: Colors.grey)),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
      labelStyle: TextStyle(color: Colors.white),
      border: InputBorder.none,
    ),
    hoverColor: Colors.white.withOpacity(0.1),
    // unselectedWidgetColor: const Color(0xff1560c6),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xff456898),
      selectionColor: Color(0xffb30875),
      selectionHandleColor: Color(0xff2c7d24),
    ),
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Color(0xffa4c3ee)),
    iconTheme: const IconThemeData(color: Colors.grey),
    dialogBackgroundColor: const Color(0xff040b15),
  ),
  AppTheme.lightMode: ThemeData(
    scaffoldBackgroundColor: MyColors.colorScaffoldLight,
   primaryColor: MyColors.colorAppLight,
    radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith(
            (states) => Colors.grey.withOpacity(.3))),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      systemOverlayStyle: SystemUiOverlayStyle.dark,

      backgroundColor: MyColors.colorContainerLight,
      iconTheme: IconThemeData(color: Color(0xFF3F3C36), size: 25),
      actionsIconTheme: IconThemeData(color: Color(0xFF3F3C36), size: 25),
    ),
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    textTheme: TextTheme(

        headline2: const TextStyle(color: Color(0xFF3F3C36)),
        bodyText1:  const TextStyle(color: MyColors.colorImageLight),
        headline6: TextStyle(color: const Color(0xFF3F3C36).withOpacity(0.5))),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey),
      labelStyle: TextStyle(color: Colors.white),
      border: InputBorder.none,
    ),
    hoverColor: Colors.white.withOpacity(0.1),
    //  unselectedWidgetColor: const Color(0xff0b4916),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xff635b0d),
      selectionColor: Color(0xff9e3228),
      selectionHandleColor: Color(0xff021c40),
    ),
    iconTheme: const IconThemeData(color: Color(0xFF3F3C36)),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color(0xFFF6F8F9),
    ),
    dialogBackgroundColor: const Color(0xFFF6F8F9),
  ),
};
