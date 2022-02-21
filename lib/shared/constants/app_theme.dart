import 'package:athlon_task/shared/constants/dimens.dart';
import 'package:athlon_task/shared/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'font_family.dart';

final ThemeData athlonThemeData = ThemeData(
  brightness: Brightness.light,
  textTheme: TextTheme(
    subtitle1: AthlonTypo.defaultStyle,
  ),
  inputDecorationTheme: InputDecorationTheme(
    // default values for InputDecorator, TextField, and TextFormField
    floatingLabelBehavior: FloatingLabelBehavior.always,
    filled: true,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(Dimens.tiny)),
        borderSide: BorderSide(color: AppColors.separator)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(Dimens.tiny)),
        borderSide: BorderSide(color: AppColors.separator)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(Dimens.tiny)),
        borderSide: BorderSide(color: AppColors.separator)),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(Dimens.tiny)),
        borderSide: BorderSide(color: AppColors.separator)),
    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    hintStyle: TextStyle(
      fontSize: 16.0,
      color: Color(0xFF798393),
    ),
  ),
  backgroundColor: AppColors.background,
  appBarTheme: AppBarTheme(
      centerTitle: false,
      brightness: Brightness.light,
      backgroundColor: AppColors.appBar),
  fontFamily: FontFamily.roboto
);
