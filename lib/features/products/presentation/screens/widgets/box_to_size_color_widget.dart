import 'package:flutter/material.dart';
import '../../../../../core/theme/color_extension.dart';
import '../../../../../core/utils/app_text_style.dart';

class BoxToSizeColorWidget extends StatelessWidget {
  final dynamic c;
  final bool selected;
  const BoxToSizeColorWidget({super.key,required this.c, required this.selected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(

      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: selected
            ? context.primaryColor.withValues(alpha: 0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: selected
              ? context.primaryColor
              : context.border,
        ),
      ),
      child: Center(
        child: Text(
          c.value,
          style: AppTextStyle.medium(
            fontSize: 14,
            color: selected
                ? context.primaryColor
                : context.textPrimary,
          ),
        ),
      ),
    );
  }
}
