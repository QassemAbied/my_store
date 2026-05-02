import 'package:flutter/material.dart';
import '../../../../../core/theme/color_extension.dart';
import '../../../../../core/utils/app_text_style.dart';

class SectionTitleWidget extends StatelessWidget {
  final String title;
  const SectionTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: AppTextStyle.semiBold(
          fontSize: 14,
          color: context.textSecondary,
        ),
      ),
    );
  }
}
