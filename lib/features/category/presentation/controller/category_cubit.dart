import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/network/use_case.dart';
import 'package:my_store/features/category/domain/usecases/get_category_use_case.dart';
import '../../domain/entities/product_by_category_request.dart';
import '../../domain/usecases/get_product_by_category_use_case.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetCategoryUseCase _getCategoryUseCase;
  final GetProductsByCategoryUseCase _getProductsByCategoryUseCase;

  CategoryCubit(this._getCategoryUseCase, this._getProductsByCategoryUseCase)
    : super(CategoryState());

  Future<void> selectCategory(String id, BuildContext context) async {
    if (state.selectedCategoryId == id) return;
    emit(state.copyWith(selectedCategoryId: id, products: []));
    if (id.isNotEmpty) {
      await getProductsByCategory(id);
    }
  }

  Future<void> getCategories(BuildContext context) async {
    emit(state.copyWith(isLoadingCategories: true));
    final result = await _getCategoryUseCase(NoParams());
    result.result.fold(
      (failure) => emit(
        state.copyWith(
          isLoadingCategories: false,
          error: 'Failed to fetch categories',
        ),
      ),
      (categories) async {
        emit(
          state.copyWith(
            isLoadingCategories: false,
            categories: categories,
            selectedCategoryId: categories.first.id,
          ),
        );
        await getProductsByCategory(categories.first.id);
      },
    );
  }

  Future<void> getProductsByCategory(String categoryId) async {
    emit(state.copyWith(isLoadingProducts: true));
    final result = await _getProductsByCategoryUseCase(
      ProductByCategoryRequest(
        categoryId: categoryId,
        fields: "id,title,description,thumbnail,*variants.calculated_price",
      ),
    );
    result.result.fold(
      (failure) => emit(state.copyWith(error: 'Failed to fetch products')),
      (products) {
        emit(
          state.copyWith(
            isLoadingProducts: false,
            products: products.products ?? [],
          ),
        );
      },
    );
  }
}
