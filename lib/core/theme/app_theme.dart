import 'package:flutter/material.dart';

import '../utils/app_text_style.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
        onPrimary: AppColors.onPrimary,
        onSecondary: AppColors.onSecondary,
        onSurface: AppColors.onSurface,
        error: AppColors.error,
      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: AppColors.primary),
        backgroundColor: AppColors.background,
        elevation: 0.0,
        titleTextStyle: AppTextStyle.bold(
          fontSize: 20,
          color: AppColors.primary,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: AppColors.border),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.primary,
        selectionColor: AppColors.primary.withValues(alpha: 0.3),
        selectionHandleColor: AppColors.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.disabled;
            }
            return AppColors.primary;
          }),
          foregroundColor: WidgetStatePropertyAll(AppColors.onPrimary),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          textStyle: WidgetStatePropertyAll(
            AppTextStyle.bold(fontSize: 18, color: AppColors.onPrimary),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          side: WidgetStatePropertyAll(BorderSide(color: AppColors.primary)),
          foregroundColor: WidgetStatePropertyAll(AppColors.primary),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          textStyle: WidgetStatePropertyAll(
            AppTextStyle.bold(fontSize: 18, color: AppColors.primary),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(AppColors.secondary),
          textStyle: WidgetStatePropertyAll(
            AppTextStyle.medium(fontSize: 16, color: AppColors.onSecondary),
          ),
        ),
      ),

    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: AppColors.primaryDark,
        secondary: AppColors.secondaryDark,
        surface: AppColors.surfaceDark,

        onPrimary: AppColors.onPrimaryDark,
        onSecondary: AppColors.onSecondaryDark,
        onSurface: AppColors.onSurfaceDark,

        error: AppColors.errorDark,
      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: AppColors.primaryDark),
        backgroundColor: AppColors.backgroundDark,
        elevation: 0.0,
        titleTextStyle: AppTextStyle.regular(
          fontSize: 20,
          color: AppColors.primaryDark,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: AppColors.borderDark),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.primaryDark,
        selectionColor: AppColors.primaryDark.withValues(alpha: 0.4),
        selectionHandleColor: AppColors.primaryDark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.disabledDark;
            }
            return AppColors.primaryDark;
          }),          foregroundColor: WidgetStatePropertyAll(AppColors.onPrimaryDark),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          textStyle: WidgetStatePropertyAll(
            AppTextStyle.bold(fontSize: 18, color: AppColors.onPrimaryDark),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          side: WidgetStatePropertyAll(BorderSide(color: AppColors.primaryDark)),
          foregroundColor: WidgetStatePropertyAll(AppColors.primaryDark),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          textStyle: WidgetStatePropertyAll(
            AppTextStyle.bold(fontSize: 18, color: AppColors.primaryDark),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(AppColors.secondaryDark),
          textStyle: WidgetStatePropertyAll(
            AppTextStyle.medium(fontSize: 16, color: AppColors.onSecondaryDark),
          ),
        ),
      ),
    );
  }
}