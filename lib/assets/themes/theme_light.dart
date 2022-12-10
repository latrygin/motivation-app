//Dark theme for app
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motivation/assets/colors/colors.dart';

var lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: whiteColorForLightTheme,
    elevation: 0,
  ),
  primaryColor: primaryColorForDarkTheme,
  hintColor: const Color(0xFFeeeff5),
  cardColor: const Color(0xFFf7f8fa),
  hoverColor: const Color(0xFF1F2127),
  fontFamily: 'YandexSansText',
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: primaryColorForDarkTheme,
    selectionColor: primaryColorForDarkTheme,
    selectionHandleColor: primaryColorForDarkTheme,
  ),
  dividerColor: greyMediumColorForLightTheme,
  scaffoldBackgroundColor: whiteColorForLightTheme,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    hoverColor: const Color(0xFFf7f8fa),
    fillColor: const Color(0xFFf7f8fa),
    focusColor: const Color(0xFFf7f8fa), //eeeff5
    hintStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: Color(0xFF9ca3ae),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: Color(0xFFeeeff5)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: Color(0xFFeeeff5)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: Color(0xFFeeeff5)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey.shade200,
      foregroundColor: Colors.grey.shade200,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      minimumSize: const Size(32, 32),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: whiteColorForLightTheme,
      ),
      backgroundColor: greyMediumColorForDarkTheme,
      foregroundColor: greyMediumColorForDarkTheme,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      minimumSize: const Size(double.infinity, 60),
    ),
  ),
  textTheme: TextTheme(
    headlineLarge: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: blackColorForLightTheme,
    ),
    headlineMedium: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: blackColorForLightTheme,
    ),
    headlineSmall: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: blackColorForLightTheme,
    ),
    labelMedium: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: whiteColorForLightTheme,
    ),
    labelLarge: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w300,
      color: blackColorForLightTheme,
    ),
    titleSmall: GoogleFonts.inter(
      height: 1.4,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.grey.shade600,
    ),
  ),
);
