
import 'package:my_store/features/home/domain/entities/product_entities.dart';

class HomeState {}

final class HomeInitial extends HomeState {}
final class ProductLoading extends HomeState {}
final class ProductSuccess extends HomeState {
  final ProductResponseEntity productEntities;

  ProductSuccess(this.productEntities);
}
final class ProductFailure extends HomeState {
  final String err;

  ProductFailure(this.err);
}
