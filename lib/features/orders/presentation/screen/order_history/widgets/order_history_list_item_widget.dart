import 'package:flutter/material.dart';
import 'package:my_store/core/network/api_contstants.dart';
import '../../../../../../core/common_widgets/custom_animated_container_widget.dart';
import '../../../../../../core/common_widgets/widgets.dart';
import '../../../../../../core/theme/color_extension.dart';
import '../../../../../../core/utils/app_text_style.dart';
import '../../../../../../core/utils/extension.dart';
import '../../../../../../core/utils/routing/routers.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../domain/entitiy/order_list_entitiy.dart';

class OrderHistoryListItemWidget extends StatelessWidget {
  const OrderHistoryListItemWidget({super.key, required this.order});
  final OrderEntity order;
  @override
  Widget build(BuildContext context) {
    return CustomAnimatedContainerWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "#${order.id.substring(6, 12)}",
                style: AppTextStyle.bold(
                  fontSize: 16,
                  color: context.textPrimary,
                ),
              ),
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
          verticalSpace(6),
          Text(
            CommonWidget.formatDate(order.createdAt),
            style: AppTextStyle.semiBold(
              fontSize: 16,
              color: context.primaryColor,
            ),
          ),
          verticalSpace(12),
          _listImage(),
          verticalSpace(12),
          _totalAndQty(context),
          verticalSpace(14),
          _buildButton(context),
        ],
      ),
    );
  }

  SizedBox _listImage() {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: order.items.length ,
        separatorBuilder: (_, _) => horizontalSpace(8),
        itemBuilder: (context, index) {
          final item = order.items[index];

          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              ApiConstants.fixImageUrl(item.thumbnail ?? ""),
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  Row _totalAndQty(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${order.items.length} items",
          style: AppTextStyle.medium(
            fontSize: 14,
            color: context.textSecondary,
          ),
        ),
        Text(
          "${order.total} €",
          style: AppTextStyle.bold(fontSize: 16, color: context.success),
        ),
      ],
    );
  }

  Row _buildButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              context.pushNamed(
                Routers.orderReview,
                arguments: {"orderId": order.id, "showButton": false},
              );
            },
            child: Text("Details"),
          ),
        ),

        horizontalSpace(10),

        Expanded(
          child: ElevatedButton(onPressed: () {}, child: Text("Reorder")),
        ),
      ],
    );
  }
}
