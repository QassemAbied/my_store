import 'package:flutter/material.dart';
import 'package:my_store/core/theme/color_extension.dart';
import 'package:my_store/core/utils/app_text_style.dart';
import 'package:my_store/core/utils/spacing.dart';
import '../custom_animated_container_widget.dart';
import '../custom_cached_image_widget.dart';

class ListItemOrderSummeryWidget extends StatelessWidget {
  final dynamic item;
  const ListItemOrderSummeryWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedContainerWidget(
      child: Row(
        children: [
          CustomNetworkImage(imageUrl: item.thumbnail ?? "",
            width: 60,
            height: 60,
          ),
          horizontalSpace(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: AppTextStyle.semiBold(
                    fontSize: 18,
                    color: context.textPrimary,
                  ),
                ),
                Text(
                  "x${item.quantity}",
                  style: AppTextStyle.regular(
                    fontSize: 16,
                    color: context.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          Text(
            "${item.quantity * item.price} €",
            style: AppTextStyle.bold(fontSize: 17, color: context.primaryColor),
          ),
        ],
      ),
    );
  }
}
