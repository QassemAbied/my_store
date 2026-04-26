import '../../../core/common_models/entities/product_entities.dart';


class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchLoading extends SearchState {}
final class SearchSuccess extends SearchState {
  final List<ProductItemEntity> searchProduct;



  SearchSuccess({required this.searchProduct});
}
final class SearchFailure extends SearchState {
  final String err;

  SearchFailure(this.err);
}
