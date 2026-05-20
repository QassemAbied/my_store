import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/products/presentation/cubit/recommenation_state.dart';
import '../../../../core/common_models/entities/product_entities.dart';
import '../../../../core/services/open_ai_service.dart';
import '../../../../core/services/shared_pref.dart';
import '../../../home/domain/entities/product_param.dart';
import '../../../home/domain/usecases/product_usecase.dart';

class RecommendationCubit extends Cubit<RecommendationState> {
  final AiService _aiService;

  final ProductUseCase _productUseCase;

  RecommendationCubit(this._aiService, this._productUseCase)
    : super(RecommendationInitial());

  final List<ProductItemEntity> products = [];

  Future<void> recommendedProducts(String title, String description) async {
    emit(RecommendationLoading());

    try {
      final regionId = SharedPrefHelper.getString(key: 'region');

      if (regionId == null) {
        emit(RecommendationFailure("Region Id is null"));

        return;
      }

      final params = ProductParams(
        fields: "id,title,description,thumbnail,*variants.calculated_price",

        reginId: regionId,

        limit: 20,

        offset: 0,

        query: '',
      );

      final result = await _productUseCase(params);

      result.result.fold(
        (failure) {
          emit(RecommendationFailure(failure.message));
        },

        (data) {
          products.clear();

          products.addAll(data.products ?? []);
        },
      );

      final recommendations = await _aiService.generateRecommendations(
        title: title,

        description: description,

        allProducts: products,
      );

      final recommendedProducts = products.where((product) {
        return recommendations.any((recommendation) {
          return recommendation.toLowerCase().trim() ==
              (product.title ?? '').toLowerCase().trim();
        });
      }).toList();

      emit(RecommendationSuccess(recommendedProducts));
    } catch (e) {
      emit(RecommendationFailure(e.toString()));
    }
  }
}
