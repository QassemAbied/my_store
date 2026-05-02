import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/utils/extension.dart';
import 'package:my_store/core/theme/theme_controller/theme_cubit.dart';
import 'package:my_store/core/utils/routing/routers.dart';
import 'package:my_store/features/settings/presentation/screens/widget/profile_card.dart';
import 'package:my_store/features/settings/presentation/screens/widget/section_title_widget.dart';
import 'package:my_store/features/settings/presentation/screens/widget/setting_card_widget.dart';
import 'package:my_store/features/settings/presentation/screens/widget/settings_button_widget.dart';
import '../../../../core/theme/color_extension.dart';
import '../../../../core/utils/enum.dart';
import '../../../../core/utils/spacing.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeIsDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ProfileCard(),
          verticalSpace(20),
          SectionTitleWidget(title: "General"),
          SettingCardWidget(
            children: [
              SettingsItem(
                icon: Icons.language,
                title: "Language",
                subtitle: "English",
                onTap: () {},
              ),
              SettingsItem(
                icon: Icons.dark_mode,
                title: "Dark Mode",
                trailing: Switch(
                  value: context.isDark,
                  onChanged: (value) {
                    themeIsDark = value;
                    context.read<ThemeCubit>().toggleTheme(
                      themeIsDark ? ThemeEnum.dark : ThemeEnum.light,
                    );
                  },
                ),
              ),
            ],
          ),

          verticalSpace(20),

          SectionTitleWidget(title: "Account"),
          SettingCardWidget(
            children: [
              SettingsItem(
                icon: Icons.person,
                title: "Profile",
                onTap: () {
                  context.pushNamed(Routers.profile);
                },
              ),
              SettingsItem(
                icon: Icons.location_on,
                title: "Addresses",
                onTap: () {
                  context.pushNamed(Routers.addressSettings);
                },
              ),
              SettingsItem(
                icon: Icons.receipt_long,
                title: "My Orders",
                onTap: () {
                  context.pushNamed(Routers.orderHistory);
                },
              ),
            ],
          ),

          verticalSpace(20),

          SectionTitleWidget(title: "Support"),
          SettingCardWidget(
            children: [
              SettingsItem(
                icon: Icons.help_outline,
                title: "Help Center",
                onTap: () {},
              ),
              SettingsItem(
                icon: Icons.privacy_tip,
                title: "Privacy Policy",
                onTap: () {},
              ),
            ],
          ),

          verticalSpace(30),

          SettingsButtonWidget(),
        ],
      ),
    );
  }
}




