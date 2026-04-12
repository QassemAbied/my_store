import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/utils/extension.dart';
import 'package:my_store/core/theme/theme_controller/theme_cubit.dart';

import '../../../../core/theme/color_extension.dart';
import '../../../../core/theme/theme_controller/theme_state.dart';
import '../../../../core/utils/enum.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
   // final themeIsDark= Theme.of(context).brightness==Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: context.primaryColor,
      ),
      body: Center(
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            final themeIsDark = Theme.of(context).brightness == Brightness.dark;

            return ElevatedButton(
              onPressed: () {
                context.read<ThemeCubit>().toggleTheme(
                  themeIsDark ? ThemeEnum.light : ThemeEnum.dark,
                );
              },
              child: const Text('Toggle Theme'),
            );
          },
        ),
      ),
    );
  }
}
