//Dark theme for app
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motivation/assets/colors/colors.dart';

var darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: blackColorForDarkTheme,
      elevation: 0,
    ),
    primaryColor: primaryColorForDarkTheme,
    hintColor: greyMediumColorForDarkTheme,
    cardColor: greyDarkColorForDarkTheme,
    hoverColor: whiteColorForDarkTheme,
    fontFamily: 'YandexSansText',
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: primaryColorForDarkTheme,
      selectionColor: primaryColorForDarkTheme,
      selectionHandleColor: primaryColorForDarkTheme,
    ),
    dividerColor: greyMediumColorForLightTheme,
    scaffoldBackgroundColor: blackColorForDarkTheme,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      hoverColor: greyDarkColorForDarkTheme,
      fillColor: greyDarkColorForDarkTheme,
      focusColor: greyDarkColorForDarkTheme, //eeeff5
      hintStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: Color(0xFF9ca3ae),
      ),
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
    textButtonTheme: TextButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: greyMediumColorForDarkTheme,
            foregroundColor: greyMediumColorForDarkTheme,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            minimumSize: const Size(32, 32))),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: whiteColorForLightTheme),
            backgroundColor: const Color(0xFFA35BFF),
            foregroundColor: const Color(0xFFA35BFF),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            minimumSize: const Size(double.infinity, 60))),
    textTheme: TextTheme(
      headlineLarge: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: whiteColorForDarkTheme),
      headlineMedium: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: whiteColorForDarkTheme),
      headlineSmall: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: whiteColorForDarkTheme),
      labelMedium: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: greyDarkColorForDarkTheme),
      labelLarge: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
          color: whiteColorForDarkTheme),
      titleSmall: GoogleFonts.inter(
          height: 1.4,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade400),
    ));
