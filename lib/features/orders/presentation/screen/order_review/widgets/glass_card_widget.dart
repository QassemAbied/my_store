import 'package:flutter/material.dart';
import '../../../../../../core/theme/color_extension.dart';
import '../../../../../../core/utils/app_text_style.dart';

class GlassCardWidget extends StatelessWidget {
  const GlassCardWidget({super.key, required this.title, required this.child});
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: context.border, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.bold(fontSize: 16, color: context.textPrimary),
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}
