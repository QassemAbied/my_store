import 'package:flutter/material.dart';
import 'package:my_store/core/utils/spacing.dart';
import 'package:my_store/features/orders/presentation/screen/order_review/widgets/time_line_order_widget.dart';
import '../../../../../../core/common_widgets/widgets.dart';
import '../../../../../../core/theme/color_extension.dart';
import '../../../../../../core/utils/app_text_style.dart';
import '../../../../domain/entitiy/order_review_entities.dart';

class HeroHeaderWidget extends StatelessWidget {
  const HeroHeaderWidget({super.key, required this.order});
  final OrderReviewEntity order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [context.primaryColor, context.secondaryColor],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TimeLineOrderWidget(),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "#${order.id.substring(6, 12)}",
                style: AppTextStyle.bold(fontSize: 24, color: Colors.white),
              ),

              Text(
                CommonWidget.formatDate(order.createdAt),
                style: AppTextStyle.semiBold(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),

              verticalSpace(10),

              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: context.warning.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CommonWidget.statusDot(context, order.status),
                    horizontalSpace(8),
                    Text(
                      CommonWidget.mapStatus(order.status),
                      style: AppTextStyle.medium(
                        fontSize: 14,
                        color: context.warning,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
