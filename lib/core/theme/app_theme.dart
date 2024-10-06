import 'package:flutter/material.dart';
import 'package:portfolio_website/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    primaryColorDark: AppColors.primaryColor,
    fontFamily: "Poppins",
    scaffoldBackgroundColor: AppColors.darkbackgroundColor,
  );
}
