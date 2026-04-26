
import 'package:my_store/core/common_models/entities/product_entities.dart';

class HomeState {}

final class HomeInitial extends HomeState {}
final class ProductLoading extends HomeState {}
final class ProductSuccess extends HomeState {
  final List<ProductItemEntity> product;
  final bool isSearch;




  ProductSuccess({required this.product,required this.isSearch});
}
final class ProductFailure extends HomeState {
  final String err;

  ProductFailure(this.err);
}


