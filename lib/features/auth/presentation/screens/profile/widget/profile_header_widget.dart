import 'package:flutter/material.dart';
import '../../../../../../core/theme/color_extension.dart';
import '../../../../../../core/utils/app_text_style.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../domain/entities/customer_entity.dart';

class ProfileHeader extends StatelessWidget {
  final CustomerEntity user;

  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        gradient: LinearGradient(
          colors: [context.primaryColor, context.secondaryColor],
        ),
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage("https://i.pravatar.cc/150"),
          ),

          verticalSpace(12),

          Text(
            "${user.firstName} ${user.lastName}",
            style: AppTextStyle.bold(fontSize: 18, color: Colors.white),
          ),

          verticalSpace(4),

          Text(
            user.email,
            style: AppTextStyle.regular(fontSize: 14, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
