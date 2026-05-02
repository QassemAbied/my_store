import 'package:flutter/material.dart';
import '../../../../../../core/theme/color_extension.dart';
import '../../../../../../core/utils/app_text_style.dart';
import '../../../../domain/entitiy/order_review_entities.dart';
import 'glass_card_widget.dart';

class TotalCardWidget extends StatelessWidget {
  const TotalCardWidget({super.key, required this.order});
  final OrderReviewEntity order;
  @override
  Widget build(BuildContext context) {
    return GlassCardWidget(
      title: 'Total',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total",
            style: AppTextStyle.semiBold(
              fontSize: 14,
              color: context.textPrimary,
            ),
          ),
          Text(
            "${order.total} €",
            style: AppTextStyle.semiBold(fontSize: 16, color: context.success),
          ),
        ],
      ),
    );
  }
}
