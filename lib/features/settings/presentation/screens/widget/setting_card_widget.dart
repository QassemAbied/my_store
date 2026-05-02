import 'package:flutter/material.dart';
import '../../../../../core/theme/color_extension.dart';
import '../../../../../core/utils/app_text_style.dart';

class SettingCardWidget extends StatelessWidget {
  final List<Widget> children;
  const SettingCardWidget({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.border),
      ),
      child: Column(children: children),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingsItem({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: context.primaryColor),
      title: Text(
        title,
        style: AppTextStyle.medium(fontSize: 14, color: context.textPrimary),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: AppTextStyle.regular(
                fontSize: 12,
                color: context.textSecondary,
              ),
            )
          : null,
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
