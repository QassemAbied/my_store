
import 'package:my_store/features/home/domain/entities/product_entities.dart';

class HomeState {}

final class HomeInitial extends HomeState {}
final class ProductLoading extends HomeState {}
final class ProductSuccess extends HomeState {
  final List<ProductItemEntity> product;



  ProductSuccess({required this.product});
}
final class ProductFailure extends HomeState {
  final String err;

  ProductFailure(this.err);
}
