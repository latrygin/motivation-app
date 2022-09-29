//Dark theme for app

import 'package:flutter/material.dart';
import 'package:motivation/assets/colors/colors.dart';

var lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColorForLightTheme,
      elevation: 0,
    ),
    fontFamily: 'YandexSansText',
    scaffoldBackgroundColor: whiteColorForLightTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: blackColorForLightTheme,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            minimumSize: const Size(double.infinity, 52))),
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: blackColorForLightTheme),
      headline2: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: blackColorForLightTheme),
      headline3: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
          color: blackColorForLightTheme),
      headline4: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w100,
          color: blackColorForLightTheme),
      bodyText1: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w900,
          color: greyDarkColorForLightTheme),
      bodyText2: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w900,
          color: greyDarkColorForLightTheme),
      labelMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
          color: whiteColorForLightTheme),
    ));
