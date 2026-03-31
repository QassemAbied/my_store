import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;

  Color get primaryColor => colorScheme.primary;
  Color get secondaryColor => colorScheme.secondary;
  Color get surfaceColor => colorScheme.surface;
  Color get onPrimaryColor => colorScheme.onPrimary;
  Color get onSecondaryColor => colorScheme.onSecondary;
  Color get onSurfaceColor => colorScheme.onSurface;
}
