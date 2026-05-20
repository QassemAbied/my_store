
import '../../../../core/common_models/entities/product_entities.dart';

sealed class RecommendationState {}

final class RecommendationInitial extends RecommendationState {}
class RecommendationLoading extends RecommendationState {}

class RecommendationSuccess extends RecommendationState {
  final List<ProductItemEntity> products;
  RecommendationSuccess(this.products);
}

class RecommendationFailure extends RecommendationState {
  final String message;
  RecommendationFailure(this.message);
}