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
    : super(CategoryInitial());

  Future<void> getCategories() async {
    emit(CategoryLoading());
    final result = await _getCategoryUseCase(NoParams());
    result.result.fold(
      (failure) => emit(CategoryError('Failed to fetch categories')),
      (categories) {
        emit(CategorySuccess(categories));
      },
    );
  }

  Future<void> getProductsByCategory(String categoryId) async {
    emit(ProductByCategoryLoading());
    final result = await _getProductsByCategoryUseCase(
      ProductByCategoryRequest(
        categoryId: categoryId,
        fields: "id,title,description,thumbnail,*variants.calculated_price",
      ),
    );
    result.result.fold(
      (failure) => emit(ProductByCategoryError('Failed to fetch products')),
      (products) {
        emit(ProductByCategorySuccess(products.products ?? []));
      },
    );
  }
}
