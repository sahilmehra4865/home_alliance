import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final light = ThemeData(
    useMaterial3: false,
    textTheme: ThemeData.light().textTheme,
    primarySwatch: black,
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.black,
    brightness: Brightness.light,
    fontFamily: "Inter",
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white, surfaceTintColor: AppColors.white, shadowColor: AppColors.white),

  );

  static final dark = ThemeData(
      useMaterial3: false,
      textTheme: ThemeData.light().textTheme,
      //textTheme: GoogleFonts.robotoTextTheme(),
      primarySwatch: white,
      scaffoldBackgroundColor: AppColors.black,
      primaryColor: AppColors.white,
      brightness: Brightness.dark,
      fontFamily: "Inter",
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.black, surfaceTintColor: AppColors.black, shadowColor: AppColors.black));

  static const MaterialColor black = MaterialColor(
    0xff000000,
    <int, Color>{
      50: Color(0xff000000),
      100: Color(0xff000000),
      200: Color(0xff000000),
      300: Color(0xff000000),
      400: Color(0xff000000),
      500: Color(0xff000000),
      600: Color(0xff000000),
      700: Color(0xff000000),
      800: Color(0xff000000),
      900: Color(0xff000000),
    },
  );

  static const MaterialColor white = MaterialColor(
    0xffffffff,
    <int, Color>{
      50: Color(0xffffffff),
      100: Color(0xffffffff),
      200: Color(0xffffffff),
      300: Color(0xffffffff),
      400: Color(0xffffffff),
      500: Color(0xffffffff),
      600: Color(0xffffffff),
      700: Color(0xffffffff),
      800: Color(0xffffffff),
      900: Color(0xffffffff),
    },
  );
}
