import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/utils/spacing.dart';

import '../../../../../core/theme/color_extension.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../domain/entities/product_details_entities.dart';
import '../../cubit/product_details_cubit.dart';
import 'box_to_size_color_widget.dart';

class SelectColorWidget extends StatelessWidget {
  final ProductDetailsEntities product;

  const SelectColorWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ProductDetailsCubit>();
    final colorOption = product.product.options
        .where((e) => e.title.toLowerCase() == "color")
        .firstOrNull;

    if (colorOption == null || colorOption.values.isEmpty) {
      return const SizedBox();
    }

    final colors = colorOption.values;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: AppTextStyle.semiBold(
            fontSize: 16,
            color: context.textPrimary,
          ),
        ),
        verticalSpace(10),
        Row(
          children: colors.map((s) {
            final selected = cubit.selectedColor == s.value;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () => cubit.selectColor(s.value, product),
                child: BoxToSizeColorWidget(c: s, selected: selected),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
