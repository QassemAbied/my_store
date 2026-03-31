import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme (){
    return ThemeData(
      colorScheme: ColorScheme.light(
        primary: AppColors.lightPrimary,
        secondary: AppColors.lightSecondary,
        surface: AppColors.lightSurface,
        onPrimary: AppColors.lightOnPrimary,
        onSecondary: AppColors.lightOnSecondary,
        onSurface: AppColors.lightOnSurface,
      ),
      brightness: Brightness.light,
    );
  }
  static ThemeData darkTheme (){
    return ThemeData(
      colorScheme: ColorScheme.dark(
        primary: AppColors.darkPrimary,
        secondary: AppColors.darkSecondary,
        surface: AppColors.darkSurface,
        onPrimary: AppColors.darkOnPrimary,
        onSecondary: AppColors.darkOnSecondary,
        onSurface: AppColors.darkOnSurface,
      ),
      brightness: Brightness.dark,
    );
  }
}