import 'package:flutter/material.dart';
import 'package:my_store/core/common_widgets/custom_primary_button.dart';

import '../../../core/theme/color_extension.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/utils/spacing.dart';

class EmptySearchView extends StatelessWidget {
  final String query;
  final VoidCallback? onClear;

  const EmptySearchView({
    super.key,
    required this.query,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.surfaceColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Icon(
                Icons.search_off_rounded,
                size: 70,
                color: context.primaryColor,
              ),
            ),

            verticalSpace(20),

            Text(
              "No results found",
              style: AppTextStyle.bold(
                fontSize: 18,
                color: context.textPrimary,
              ),
            ),

            verticalSpace(8),

            Text(
              "No results for \"$query\"",
              textAlign: TextAlign.center,
              style: AppTextStyle.medium(
                fontSize: 14,
                color: context.textSecondary,
              ),
            ),

            verticalSpace(8),

            Text(
              "Try searching with different keywords",
              textAlign: TextAlign.center,
              style: AppTextStyle.regular(
                fontSize: 15,
                color: context.textSecondary,
              ),
            ),

            verticalSpace(20),

            if (onClear != null)
              CustomElevatedButton(
                  onPressed: onClear,
                  text:  "Clear Search"
              )
          ],
        ),
      ),
    );
  }
}