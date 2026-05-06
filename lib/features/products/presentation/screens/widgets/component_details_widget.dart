import 'package:flutter/material.dart';
import 'package:my_store/features/products/presentation/screens/widgets/select_color_widget.dart';
import 'package:my_store/features/products/presentation/screens/widgets/select_size_widget.dart';
import '../../../../../core/theme/color_extension.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../domain/entities/product_details_entities.dart';

class ComponentDetailsWidget extends StatelessWidget {
  final ProductDetailsEntities product;
  const ComponentDetailsWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.product.title,
            style: AppTextStyle.bold(
              fontSize: 22,
              color: context.textPrimary,
            ),
          ),

          verticalSpace(6),

          Text(
            product.product.collection?.title ?? "",
            style: AppTextStyle.medium(
              fontSize: 14,
              color: context.textSecondary,
            ),
          ),

          verticalSpace(20),

          SelectSizeWidget(product: product),
          verticalSpace(20),
          SelectColorWidget(product: product),
          verticalSpace(20),

          Text(
            "Description",
            style: AppTextStyle.semiBold(
              fontSize: 16,
              color: context.textPrimary,
            ),
          ),

          verticalSpace(8),

          Text(
            product.product.description,
            style: AppTextStyle.regular(
              fontSize: 14,
              color: context.textSecondary,
            ),
          ),

        ],
      ),
    );
  }
}
