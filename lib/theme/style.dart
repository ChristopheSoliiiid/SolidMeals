import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: Colors.white,
    ),
    primaryTextTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
    primaryIconTheme: IconThemeData.fallback().copyWith(
      color: Colors.black,
    ),
    primarySwatch: Colors.blue,
    accentColor: Colors.blueGrey,
    canvasColor: Color.fromRGBO(240, 240, 240, 1),
    fontFamily: 'Raleway',
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          headline6: TextStyle(
            fontSize: 22,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
