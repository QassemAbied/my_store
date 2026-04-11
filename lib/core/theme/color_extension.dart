import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  bool get isDark => theme.brightness == Brightness.dark;

  Color get primaryColor => colorScheme.primary;
  Color get secondaryColor => colorScheme.secondary;
  Color get surfaceColor => colorScheme.surface;
  Color get onPrimaryColor => colorScheme.onPrimary;
  Color get onSecondaryColor => colorScheme.onSecondary;
  Color get textSecondary  => colorScheme.onSurface;

  // Custom colors
  Color get textPrimary  =>
      isDark ? AppColors.onBackgroundDark : AppColors.onBackground;

  Color get error =>
      isDark ? AppColors.errorDark : AppColors.error;

  Color get success =>
      isDark ? AppColors.successDark : AppColors.success;

  Color get warning =>
      isDark ? AppColors.warningDark : AppColors.warning;

  Color get border =>
      isDark ? AppColors.borderDark : AppColors.border;

  Color get outline =>
      isDark ? AppColors.outlineDark : AppColors.outline;

  Color get disabled =>
      isDark ? AppColors.disabledDark : AppColors.disabled;
}