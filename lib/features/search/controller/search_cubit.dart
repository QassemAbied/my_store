import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/search/controller/search_state.dart';
import '../../../core/services/open_ai_service.dart';
import '../../../core/services/shared_pref.dart';
import '../../home/domain/entities/product_param.dart';
import '../../home/domain/usecases/search_use_case.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase _searchUseCase;
  final AiService _aiService;

  SearchCubit(this._searchUseCase, this._aiService) : super(SearchInitial());

  Future<void> search({required String? query}) async {
    if (query == null || query.trim().isEmpty) {
      emit(SearchSuccess(searchProduct: []));
      return;
    }

    emit(SearchLoading());

    try {
      final regionId = SharedPrefHelper.getString(key: 'region');

      final result = await _searchUseCase(
        ProductParams(
          limit: 50,
          offset: 0,
          reginId: regionId!,
          fields: "id,title,description,thumbnail,*variants.calculated_price",
          query: null,
        ),
      );

      result.result.fold(
        (failure) {
          emit(SearchFailure(failure.message));
        },

        (data) async {
          final keywords = await _aiService.generateSearchKeywords(query);

          keywords.add(query.toLowerCase());

          final searchProduct = data.products!.where((product) {
            final searchableText =
                '''
                     ${product.title}
                     ${product.description}
                     ${product.subtitle}
                '''
                    .toLowerCase();

            return keywords.any(
              (keyword) => searchableText.contains(keyword.toLowerCase()),
            );
          }).toList();

          emit(SearchSuccess(searchProduct: searchProduct));
        },
      );
    } catch (e) {
      emit(SearchFailure(e.toString()));
    }
  }
}
