import 'package:flutter/material.dart';
import 'package:my_store/core/theme/app_colors.dart';
import 'package:my_store/core/theme/color_extension.dart';
import 'package:my_store/core/utils/app_text_style.dart';
import 'package:my_store/core/utils/spacing.dart';

import '../../../../../../core/common_widgets/custom_animated_container_widget.dart';

class SecureTextWidget extends StatelessWidget {
  const SecureTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedContainerWidget(
      child: Row(
        children: [
          Icon(Icons.lock, color: AppColors.success),
          horizontalSpace(10),
          Expanded(
            child: Text(
              "Secure payment powered by Stripe",
              style: AppTextStyle.medium(
                fontSize: 20,
                color: context.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
