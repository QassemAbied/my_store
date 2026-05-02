import 'package:flutter/material.dart';
import 'package:my_store/core/theme/color_extension.dart';
import '../../../../../../core/utils/app_text_style.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../domain/entitiy/order_review_entities.dart';
import 'glass_card_widget.dart';

class AddressWidget extends StatelessWidget {
  final OrderReviewEntity order;

  const AddressWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final a = order.address;
    return GlassCardWidget(
      title: "Delivery Address",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name: ${a?.firstName ?? ""} ${a?.lastName ?? ""}",
            style: AppTextStyle.bold(fontSize: 16, color: context.textPrimary),
          ),
          verticalSpace(4),
          Text(
            'Address: ${a?.address}',
            style: AppTextStyle.medium(
              fontSize: 14,
              color: context.textSecondary,
            ),
          ),

          Text(
            "City: ${a?.city}, ${a?.country}",
            style: AppTextStyle.medium(
              fontSize: 14,
              color: context.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
