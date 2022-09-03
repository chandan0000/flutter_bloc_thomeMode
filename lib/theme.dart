
import 'package:flutter/material.dart';
class AppTheme{
static final  ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      )
  ),
);

static final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xff15161a),
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: Color(0xff15161a),
  ),
);
}