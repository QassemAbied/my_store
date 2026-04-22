import 'package:flutter/material.dart';
import 'package:my_store/core/theme/color_extension.dart';
import '../../../../../../core/common_widgets/custom_animated_container_widget.dart';
import '../../../../../../core/utils/app_text_style.dart';
import '../../../../domain/entitiy/order_review_entities.dart';

class AddressWidget extends StatelessWidget {
  final OrderReviewEntity order;

  const AddressWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CustomAnimatedContainerWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shipping Address",
                style: AppTextStyle.bold(
                  fontSize: 20,
                  color: context.primaryColor,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                order.address?.address ?? "",
                style: AppTextStyle.bold(
                  fontSize: 17,
                  color: context.textPrimary,
                ),
              ),
              Text(
                order.address?.city ?? "",
                style: AppTextStyle.bold(
                  fontSize: 17,
                  color: context.textPrimary,
                ),
              ),
              Text(
                order.address?.country ?? "",
                style: AppTextStyle.bold(
                  fontSize: 17,
                  color: context.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
