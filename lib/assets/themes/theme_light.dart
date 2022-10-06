//Dark theme for app

import 'package:flutter/material.dart';
import 'package:motivation/assets/colors/colors.dart';

var lightTheme = ThemeData(
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: Color(0xFF21232b)),
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColorForLightTheme,
      elevation: 0,
    ),
    colorScheme: const ColorScheme.light(
      background: whiteColorForLightTheme,
      primary: greyDarkColorForLightTheme,
    ),
    fontFamily: 'YandexSansText',
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: greyMediumColorForLightTheme,
      selectionColor: greyMediumColorForLightTheme,
      selectionHandleColor: greyMediumColorForLightTheme,
    ),
    dividerColor: greyMediumColorForLightTheme,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      hoverColor: const Color(0xFFf7f8fa),
      fillColor: const Color(0xFFf7f8fa),
      focusColor: const Color(0xFFf7f8fa), //eeeff5
      hintStyle: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w300, color: Color(0xFF9ca3ae)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Color(0xFFeeeff5), width: 2)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Color(0xFFeeeff5), width: 2)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Color(0xFFeeeff5), width: 2)),
    ),
    scaffoldBackgroundColor: whiteColorForLightTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: whiteColorForLightTheme),
            backgroundColor: Color(0xFFA35BFF),
            foregroundColor: Color(0xFFA35BFF),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            minimumSize: const Size(double.infinity, 60))),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: blackColorForLightTheme),
      headlineMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: blackColorForLightTheme),
      headlineSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: blackColorForLightTheme),
      labelMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: whiteColorForLightTheme),
    ));
