import 'package:my_store/features/products/domain/entities/product_details_entities.dart';

class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsSuccess extends ProductDetailsState {
  final ProductDetailsEntities productDetailsEntities;

  ProductDetailsSuccess(this.productDetailsEntities);
}

final class ProductDetailsFailure extends ProductDetailsState {
  final String message;

  ProductDetailsFailure(this.message);
}
