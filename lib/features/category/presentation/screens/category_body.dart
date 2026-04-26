import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/category/presentation/screens/widgets/category_list_view_widget.dart';
import 'package:my_store/features/category/presentation/screens/widgets/category_loading_widget.dart';
import 'package:my_store/features/category/presentation/screens/widgets/empty_product_and_category_widget.dart';
import 'package:my_store/core/common_widgets/custom_grid_view/product_grid_view_widget.dart';
import 'package:my_store/core/common_widgets/custom_grid_view/product_grid_loading_widget.dart';

import '../../../../core/utils/spacing.dart';
import '../controller/category_cubit.dart';
import '../controller/category_state.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key, required this.cartKey});
  final GlobalKey cartKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state.isLoadingCategories) {
          if (state.products.isEmpty) {
            return const CategoriesShimmer();
          }
          return const CategoriesShimmer();
        }

        if (state.error != null) {
          return Center(child: Text(state.error!));
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryListViewWidget(
                categories: state.categories,
                selectedId: state.selectedCategoryId,
              ),

              verticalSpace(20),

              Expanded(
                child: state.isLoadingProducts
                    ? const ProductsGridShimmer()
                    : state.products.isEmpty
                    ? EmptyCategoryScreen(
                        categoryName: state.selectedCategoryId!,
                      )
                    : ProductListViewWidget(
                        product: state.products,
                        cartKey: cartKey,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
