import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/color_extension.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../domain/entities/product_details_entities.dart';
import '../../cubit/product_details_cubit.dart';
import 'box_to_size_color_widget.dart';

class SelectSizeWidget extends StatelessWidget {
  final ProductDetailsEntities product;

  const SelectSizeWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ProductDetailsCubit>();

    final sizeOption = product.product.options
        .where((e) => e.title.toLowerCase() == "size")
        .firstOrNull;

    if (sizeOption == null || sizeOption.values.isEmpty) {
      return const SizedBox();
    }

    final sizes = sizeOption.values;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Size",
          style: AppTextStyle.semiBold(
            fontSize: 16,
            color: context.textPrimary,
          ),
        ),
        verticalSpace(10),
        Row(
          children: sizes.map((s) {
            final selected = cubit.selectedSize == s.value;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () => cubit.selectSize(s.value, product),
                child: BoxToSizeColorWidget(c: s, selected: selected),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
