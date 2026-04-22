import 'package:flutter/material.dart';
import 'package:my_store/core/theme/color_extension.dart';
import 'package:my_store/core/utils/app_text_style.dart';
import 'package:my_store/core/utils/spacing.dart';

import '../../../../../../core/common_widgets/custom_animated_container_widget.dart';
import '../../../../domain/entitiy/order_review_entities.dart';

class HeaderOrderReviewWidget extends StatelessWidget {
  final OrderReviewEntity order;
  const HeaderOrderReviewWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomAnimatedContainerWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order #${order.id.substring(6)}",
                style: AppTextStyle.bold(
                  fontSize: 16,
                  color: context.textPrimary,
                ),
              ),
              verticalSpace(4),
              Text(
                order.status,
                style: AppTextStyle.bold(
                  fontSize: 14,
                  color: context.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
