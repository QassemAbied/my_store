import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';

class CartItemDeleteWidget extends StatelessWidget {
  final dynamic item;
  final VoidCallback onDelete;

 const CartItemDeleteWidget({super.key,required this.item, required this.onDelete, });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onDelete,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.error.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),

        child: const Icon(
          Icons.delete,
          color: AppColors.error,
          size: 25,
        ),
      ),
    );
  }
}
