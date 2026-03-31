import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/services/shared_pref.dart';
import 'package:my_store/core/theme/theme_controller/theme_state.dart';
import 'package:my_store/core/utils/constants.dart';
import 'package:my_store/core/utils/enum.dart';


class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial()){
    saveTheme();
  }
  static ThemeCubit get(BuildContext context) => BlocProvider.of(context);
  ThemeEnum currentTheme = ThemeEnum.system;
  void toggleTheme(ThemeEnum themeMode) {
    currentTheme = themeMode;
    SharedPrefHelper.setData(key: AppConstants.themeKey, value: themeMode.name);

    emit(ToggleTheme());
  }

  ThemeMode themeMode() {
    switch (currentTheme) {
      case ThemeEnum.light:
        return ThemeMode.light;

      case ThemeEnum.dark:
        return ThemeMode.dark;
      case ThemeEnum.system:
        return ThemeMode.system;
    }
  }

  void saveTheme() {
    final savedTheme = SharedPrefHelper.getString(key: AppConstants.themeKey);
    if (savedTheme != null) {
      currentTheme = ThemeEnum.values.firstWhere(
        (e) => e.name == savedTheme,
        orElse: () => ThemeEnum.system,
      );
    }
    emit(ToggleTheme());
  }
}
