//Dark theme for app

import 'package:flutter/material.dart';
import 'package:motivation/assets/colors/colors.dart';

var darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: blackColorForDarkTheme,
      elevation: 0,
    ),
    fontFamily: 'YandexSansText',
    scaffoldBackgroundColor: blackColorForDarkTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: whiteColorForDarkTheme,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            minimumSize: const Size(double.infinity, 52))),
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: whiteColorForDarkTheme),
      headline2: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: whiteColorForDarkTheme),
      headline3: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: whiteColorForDarkTheme),
      headline4: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: whiteColorForDarkTheme),
      bodyText1: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w900,
          color: greyLightColorForDarkTheme),
      bodyText2: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w900,
          color: greyLightColorForDarkTheme),
      labelMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: greyDarkColorForDarkTheme),
    ));
