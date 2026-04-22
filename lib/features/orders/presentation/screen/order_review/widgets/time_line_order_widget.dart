import 'package:flutter/material.dart';
import 'package:my_store/core/theme/color_extension.dart';
import 'package:my_store/core/utils/app_text_style.dart';
import 'package:my_store/core/utils/spacing.dart';

import '../../../../../../core/common_widgets/widgets.dart';

class TimeLineOrderWidget extends StatelessWidget {
  const TimeLineOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _Track(
              context: context,
              title: "Order placed",
              icon: Icons.border_left_rounded,
            ),
            verticalSpace(6),
            _Track(
              context: context,
              title: "Payment confirmed",
              icon: Icons.payment,
            ),
            verticalSpace(6),
            _Track(
              context: context,
              title: "Shipped",
              icon: Icons.local_shipping_outlined,
            ),
            verticalSpace(6),
            _Track(
              context: context,
              title: "Delivered",
              icon: Icons.delivery_dining_outlined,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _Track({
  required BuildContext context,
  required String title,
  required IconData icon,
}) {
  return Row(
    children: [
      CommonWidget.leadingIcon(context, icon),
      const SizedBox(width: 10),
      Text(
        title,
        style: AppTextStyle.medium(fontSize: 16, color: context.textPrimary),
      ),
    ],
  );
}
