import 'package:flutter/material.dart';

import '../../../../../../core/theme/color_extension.dart';
import '../../../../../../core/utils/app_text_style.dart';
import '../../../../domain/entities/customer_entity.dart';

class ProfileInfoCard extends StatelessWidget {
  final CustomerEntity user;

  const ProfileInfoCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: context.border),
      ),
      child: Column(
        children: [
          _InfoItem(
            icon: Icons.person,
            title: "First Name",
            value: user.firstName,
          ),
          _Divider(),
          _InfoItem(
            icon: Icons.person_outline,
            title: "Last Name",
            value: user.lastName,
          ),
          _Divider(),
          _InfoItem(icon: Icons.email, title: "Email", value: user.email),
          _Divider(),
          _InfoItem(
            icon: Icons.phone,
            title: "Phone",
            value: user.phone ?? "Not provided",
          ),
          _Divider(),
          _InfoItem(
            icon: Icons.location_on,
            title: "Country",
            value: user.country ?? "Unknown",
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: context.primaryColor),
      title: Text(
        title,
        style: AppTextStyle.medium(fontSize: 13, color: context.textSecondary),
      ),
      subtitle: Text(
        value,
        style: AppTextStyle.bold(fontSize: 14, color: context.textPrimary),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, color: context.border);
  }
}