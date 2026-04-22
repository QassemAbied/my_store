import 'package:flutter/material.dart';
import 'package:my_store/core/common_widgets/custom_order_summery/total_order_summery_widget.dart';
import 'package:my_store/core/utils/spacing.dart';
import '../../theme/color_extension.dart';
import '../../utils/app_text_style.dart';
import 'list_item_order_summery_widget.dart';

class OrderSummeryWidget extends StatelessWidget {
  final List items;
  final int subtotal;
  final int shippingTotal;
  final int total;
  const OrderSummeryWidget({
    super.key,
    required this.items,
    required this.subtotal,
    required this.shippingTotal,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Order Summary",
            style: AppTextStyle.bold(fontSize: 18, color: context.textPrimary),
          ),
        ),

        verticalSpace(10),

        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: ListItemOrderSummeryWidget(item: item),
          ),
        ),

        verticalSpace(10),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TotalOrderSummeryWidget(
            subtotal: subtotal,
            shippingTotal: shippingTotal,
            total: total,
          ),
        ),
      ]),
    );
  }
}
