import 'package:flutter/material.dart';
import 'package:my_store/core/common_widgets/custom_order_summery/total_order_summery_widget.dart';
import 'package:my_store/core/utils/spacing.dart';
import '../../theme/color_extension.dart';
import '../../utils/app_text_style.dart';
import 'list_item_order_summery_widget.dart';

class OrderSummeryWidget extends StatelessWidget {
  final List items;
  final dynamic item;
  final bool isShow;
  const OrderSummeryWidget({
    super.key,
    required this.items,
   required this.item,
    this.isShow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order Summary",
          style: AppTextStyle.bold(fontSize: 18, color: context.textPrimary),
        ),

        verticalSpace(10),

        ...items.map(
              (item) => ListItemOrderSummeryWidget(item: item),
        ),

        verticalSpace(10),

        isShow?   TotalOrderSummeryWidget(
          subtotal: item.subtotal,
          shippingTotal: item.shippingTotal,
          total: item.total,
        ):verticalSpace(0),
      ],
    );
  }
}
