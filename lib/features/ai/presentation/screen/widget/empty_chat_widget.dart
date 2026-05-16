import 'package:flutter/material.dart';

import '../../../../../core/theme/color_extension.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/spacing.dart';

class EmptyChatWidget extends StatelessWidget {
  const EmptyChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: context.primaryColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.auto_awesome,
                  size: 50,
                  color: context.primaryColor,
                ),
              ),
              verticalSpace(24),
              Text(
                "Welcome to AI Assistant",
                textAlign: TextAlign.center,
                style: AppTextStyle.bold(
                  fontSize: 28,
                  color: context.textPrimary,
                ),
              ),
              verticalSpace(14),
              Text(
                "Ask anything, generate ideas,\nwrite code, or chat with AI.",
                textAlign: TextAlign.center,
                style: AppTextStyle.medium(
                  fontSize: 16,
                  color: context.textSecondary,
                ),
              ),
              verticalSpace(40),
              Wrap(
                spacing: 12,

                runSpacing: 12,

                alignment: WrapAlignment.center,

                children: [
                  _buildSuggestionChip(context, "Write clean architecture"),
                  _buildSuggestionChip(context, "Generate UI ideas"),
                  _buildSuggestionChip(context, "Explain Flutter Bloc"),
                  _buildSuggestionChip(context, "Write clean architecture"),
                  _buildSuggestionChip(context, "Generate UI ideas"),
                  _buildSuggestionChip(context, "Help me debug code"),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildSuggestionChip(BuildContext context, String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

    decoration: BoxDecoration(
      color: context.border,

      borderRadius: BorderRadius.circular(16),
    ),

    child: Text(
      text,
      style: AppTextStyle.medium(fontSize: 14, color: context.textPrimary),
    ),
  );
}
