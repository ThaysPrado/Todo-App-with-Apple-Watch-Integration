import 'package:flutter/material.dart';

ThemeData makeAppTheme() {
  const primaryColor = Color.fromARGB(255, 51, 112, 243);
  const secondaryColor = Color.fromARGB(255, 42, 63, 157);
  const textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: primaryColor
    )
  );
  const inputDecorationTheme = InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: primaryColor)
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: primaryColor)
    ),
    alignLabelWithHint: true
  );
  final buttonTheme = ButtonThemeData(
    colorScheme: const ColorScheme.light(primary: primaryColor),
    buttonColor: primaryColor,
    splashColor: primaryColor,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20)
    )
  );
  const floatingButtonTheme = FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    splashColor: primaryColor,
  );
  
  return ThemeData(
    primaryColor: primaryColor,
    primaryColorDark: primaryColor,
    primaryColorLight: primaryColor,
    highlightColor: secondaryColor,
    secondaryHeaderColor: secondaryColor,
    colorScheme: const ColorScheme.light(primary: primaryColor),
    backgroundColor: Colors.white,
    textTheme: textTheme,
    inputDecorationTheme: inputDecorationTheme,
    buttonTheme: buttonTheme,
    floatingActionButtonTheme: floatingButtonTheme,
  );
}