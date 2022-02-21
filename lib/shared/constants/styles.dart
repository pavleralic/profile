import 'package:flutter/material.dart';

import 'colors.dart';
import 'font_family.dart';

class AthlonTypo {
  AthlonTypo._();

  static TextStyle defaultStyle = TextStyle(
    letterSpacing: 0.4,
    fontSize: 16.0,
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  );

  static TextStyle largeStyle = TextStyle(
    letterSpacing: 0.4,
    fontSize: 28.0,
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w300,
    color: AppColors.textDark,
  );

  static TextStyle lightStyle = TextStyle(
    letterSpacing: 0.4,
    fontFamily: FontFamily.roboto,
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.textLight,
  );
}