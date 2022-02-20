import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'font_family.dart';

final ThemeData athlonThemeData = ThemeData(
  brightness: Brightness.light,
  textTheme: const TextTheme(
    subtitle1: TextStyle(fontSize: 16, color: Color(0xFf30343B)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    // default values for InputDecorator, TextField, and TextFormField
    floatingLabelBehavior: FloatingLabelBehavior.always,
    filled: true,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: Color(0xFFC9CDD4))),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: Color(0xFFC9CDD4))),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: Color(0xFFC9CDD4))),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: Color(0xFFC9CDD4))),
    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    hintStyle: TextStyle(
      fontSize: 16.0,
      color: Color(0xFF798393),
    ),
  ),
  appBarTheme: AppBarTheme(
      centerTitle: false,
      brightness: Brightness.light,
      backgroundColor: AppColors.appBar),
  fontFamily: FontFamily.roboto,
);
