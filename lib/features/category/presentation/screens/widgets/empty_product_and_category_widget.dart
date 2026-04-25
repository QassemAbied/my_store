import 'package:flutter/material.dart';

import '../../../../../core/theme/color_extension.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/spacing.dart';

class EmptyCategoryScreen extends StatelessWidget {
  final String categoryName;

  const EmptyCategoryScreen({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// 📦 Icon
            Icon(
              Icons.inventory_2_outlined,
              size: 80,
              color: context.primaryColor,
            ),

            verticalSpace(20),

            /// 🏷️ Title
            Text(
              "No products in $categoryName",
              textAlign: TextAlign.center,
              style: AppTextStyle.bold(
                fontSize: 18,
                color: context.textPrimary,
              ),
            ),

            verticalSpace(10),

            /// 📝 Subtitle
            Text(
              "Try another category",
              textAlign: TextAlign.center,
              style: AppTextStyle.regular(
                fontSize: 14,
                color: context.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}