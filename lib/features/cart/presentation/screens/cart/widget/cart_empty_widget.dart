import 'package:flutter/material.dart';
import 'package:my_store/core/theme/app_colors.dart';
import 'package:my_store/core/theme/color_extension.dart';
import 'package:my_store/core/utils/app_text_style.dart';
import 'package:my_store/core/utils/spacing.dart';

class EmptyCartWidget extends StatelessWidget {

  const EmptyCartWidget({super.key, });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.disabled.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.shopping_cart_outlined,
              size: 60,
              color: Colors.grey,
            ),
          ),

          verticalSpace(20),

          Text(
            "Your cart is empty",
            style: AppTextStyle.bold(fontSize: 18, color: context.textPrimary),
          ),
          verticalSpace(8),
          Text(
            "Looks like you haven’t added anything yet",
            style: AppTextStyle.regular(
              fontSize: 14,
              color: context.textSecondary,
            ),
          ),

          verticalSpace(20),

          ElevatedButton(
            onPressed:(){

            },
            child: const Text("Start Shopping"),
          ),
        ],
      ),
    );
  }
}
