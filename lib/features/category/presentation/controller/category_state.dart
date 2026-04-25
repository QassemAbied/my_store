import '../../../../core/common_models/entities/product_entities.dart';
import '../../domain/entities/category_entities.dart';

class CategoryState {
  final List<CategoryEntities> categories;
  final List<ProductItemEntity> products;

  final String? selectedCategoryId;

  final bool isLoadingCategories;
  final bool isLoadingProducts;

  final String? error;

  CategoryState({
    this.categories = const [],
    this.products = const [],
    this.selectedCategoryId,
    this.isLoadingCategories = false,
    this.isLoadingProducts = false,
    this.error,
  });

  CategoryState copyWith({
    List<CategoryEntities>? categories,
    List<ProductItemEntity>? products,
    String? selectedCategoryId,
    bool? isLoadingCategories,
    bool? isLoadingProducts,
    String? error,
  }) {
    return CategoryState(
      categories: categories ?? this.categories,
      products: products ?? this.products,
      selectedCategoryId:
      selectedCategoryId ?? this.selectedCategoryId,
      isLoadingCategories:
      isLoadingCategories ?? this.isLoadingCategories,
      isLoadingProducts:
      isLoadingProducts ?? this.isLoadingProducts,
      error: error,
    );
  }
}