import 'package:flutter/material.dart';
import 'package:my_store/features/category/presentation/screens/widgets/product_loading_widget.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/theme/color_extension.dart';
import '../../../../../core/utils/spacing.dart';

class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            separatorBuilder: (_, _) => horizontalSpace(10),
            itemBuilder: (_, _) {
              return Shimmer.fromColors(
                baseColor: context.border,
                highlightColor: context.surfaceColor,
                child: Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              );
            },
          ),
        ),
        verticalSpace(20),
        Expanded(child: ProductsShimmer()),
      ],
    );
  }
}