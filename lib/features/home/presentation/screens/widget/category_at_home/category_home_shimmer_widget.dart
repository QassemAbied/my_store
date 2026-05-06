import 'package:flutter/material.dart';
import 'package:my_store/core/theme/color_extension.dart';

import '../../../../../../core/utils/spacing.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (_, index) {
                return Container(
                  width: 90,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: context.border,
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              },
            ),
          ),

          verticalSpace(20),

          ProductCategoryShimmer(),
        ],
      ),
    );
  }
}

class ProductCategoryShimmer extends StatelessWidget {
  const ProductCategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (_, index) {
          return Container(
            width: 120,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: context.border,
              borderRadius: BorderRadius.circular(16),
            ),
          );
        },
      ),
    );
  }
}
