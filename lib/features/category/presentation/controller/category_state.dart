import '../../../../core/common_models/entities/product_entities.dart';
import '../../domain/entities/category_entities.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<CategoryEntities> categories;

  CategorySuccess(this.categories);
}

class CategoryError extends CategoryState {
  final String message;

  CategoryError(this.message);
}

class ProductByCategoryLoading extends CategoryState {}

class ProductByCategorySuccess extends CategoryState {
  final List<ProductItemEntity> products;

  ProductByCategorySuccess(this.products);
}

class ProductByCategoryError extends CategoryState {
  final String message;

  ProductByCategoryError(this.message);
}
