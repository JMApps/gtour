import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.red,
    fontFamily: 'Nexa',
    scaffoldBackgroundColor: const Color(0xFFE0F2F1),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Color(0xFF009688),
    ),
    cardColor: const Color(0xFFFFFFFF),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFF44336),
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelAlignment: FloatingLabelAlignment.center,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Color(0xFF009688),
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Color(0xD9F44336),
          width: 1,
        ),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.amber,
    fontFamily: 'Nexa',
    scaffoldBackgroundColor: const Color(0xFF263238),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Color(0xFF182226),
    ),
    cardColor: const Color(0xFF182226),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFFFC107),
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelAlignment: FloatingLabelAlignment.center,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Color(0xFFFFC107),
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Color(0xD9F44336),
          width: 1,
        ),
      ),
    ),
  );
}

extension ColorSchemes on ColorScheme {

  Color get accentColor => brightness == Brightness.light
      ? const Color(0xFFF44336)
      : const Color(0xFFFFC107);

  Color get idCircleBackground => brightness == Brightness.light
      ? const Color(0x80009688)
      : const Color(0xFF263238);

  Color get materialButtonColor => brightness == Brightness.light
      ? const Color(0xFFFF756C)
      : const Color(0xFF9B7200);

  Color get dateIconColors => brightness == Brightness.light
      ? const Color(0xFF009688)
      : const Color(0xFF9B7200);
}
