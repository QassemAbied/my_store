import 'package:flutter/material.dart';
import '../../../../../core/theme/color_extension.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/spacing.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key, required this.subTitle, required this.title});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(40),
        Text(
          title,
          style: AppTextStyle.bold(
            fontSize: 23,
            color: context.textPrimary,
          ),
        ),
        verticalSpace(10),
        Text(
          subTitle,
          style: AppTextStyle.semiBold(
            fontSize: 20,
            color: context.textSecondary,
          ),
        ),
        verticalSpace(40),
      ],
    );
  }
}
