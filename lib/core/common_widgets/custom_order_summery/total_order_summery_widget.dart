import 'package:flutter/material.dart';
import 'package:my_store/core/theme/color_extension.dart';
import 'package:my_store/core/utils/spacing.dart';
import '../../utils/app_text_style.dart';
import '../custom_animated_container_widget.dart';

class TotalOrderSummeryWidget extends StatelessWidget {
  final int subtotal;
  final int shippingTotal;
  final int total;
  const TotalOrderSummeryWidget({
    super.key,
    required this.subtotal,
    required this.shippingTotal,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedContainerWidget(
      child: Column(
        children: [
          _row("Subtotal", "$subtotal €", context),
          _row("Shipping", "${shippingTotal ?? 0} €", context),
          verticalSpace(5),
          const Divider(),
          verticalSpace(5),
          _row("Total", "$total €", context, isBold: true),
        ],
      ),
    );
  }

  Widget _row(
    String title,
    String value,
    BuildContext context, {
    bool isBold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyle.bold(
              fontSize: isBold ? 20 : 17,
              color: isBold ? context.primaryColor : context.textPrimary,
            ),
          ),
          Text(
            value,
            style: AppTextStyle.bold(
              fontSize: isBold ? 19 : 17,
              color: isBold ? context.primaryColor : context.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
