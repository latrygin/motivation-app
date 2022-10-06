//Dark theme for app
import 'package:flutter/material.dart';
import 'package:motivation/assets/colors/colors.dart';

var darkTheme = ThemeData(
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: greyMediumColorForLightTheme,
      selectionColor: greyMediumColorForLightTheme,
      selectionHandleColor: greyMediumColorForLightTheme,
    ),
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: blackColorForDarkTheme,
      elevation: 0,
    ),
    fontFamily: 'YandexSansText',
    scaffoldBackgroundColor: blackColorForDarkTheme,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      hoverColor: greyDarkColorForDarkTheme,
      fillColor: greyDarkColorForDarkTheme,
      focusColor: greyDarkColorForDarkTheme, //eeeff5
      hintStyle: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w300, color: Color(0xFF9ca3ae)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide:
              const BorderSide(color: greyMediumColorForDarkTheme, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide:
              const BorderSide(color: greyMediumColorForDarkTheme, width: 2)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide:
              const BorderSide(color: greyMediumColorForDarkTheme, width: 2)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: whiteColorForDarkTheme,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            minimumSize: const Size(double.infinity, 60))),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: whiteColorForDarkTheme),
      headlineMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: whiteColorForDarkTheme),
      headlineSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: whiteColorForDarkTheme),
      labelMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: greyDarkColorForDarkTheme),
    ));
