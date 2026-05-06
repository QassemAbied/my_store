import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../category/presentation/controller/category_cubit.dart';
import '../../../../../category/presentation/controller/category_state.dart';
import '../../../../../category/presentation/screens/widgets/category_list_view_widget.dart';
import '../../../../../category/presentation/screens/widgets/empty_product_and_category_widget.dart';
import 'category_home_shimmer_widget.dart';
import 'list_product_of_category_widget.dart';

class CategoryHomeWidget extends StatelessWidget {
  const CategoryHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state.isLoadingCategories) {
          if (state.products.isEmpty) {
            return const CategoryShimmer();
          }
          return const CategoryShimmer();
        }
        return Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
          child: Column(
            children: [
              CategoryListViewWidget(
                categories: state.categories,
                selectedId: state.selectedCategoryId,
              ),
              verticalSpace(20),
              state.isLoadingProducts
                  ? const ProductCategoryShimmer()
                  : state.products.isEmpty
                  ? EmptyCategoryScreen(categoryName: state.selectedCategoryId!)
                  : ListProductOfCategoryWidget(products: state.products),
            ],
          ),
        );
      },
    );
  }
}
