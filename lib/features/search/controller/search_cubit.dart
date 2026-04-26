

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/search/controller/search_state.dart';

import '../../../core/services/shared_pref.dart';
import '../../home/domain/entities/product_param.dart';
import '../../home/domain/usecases/search_use_case.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase _searchUseCase;

  SearchCubit(this._searchUseCase) : super(SearchInitial());



  Future<void> search({ required String? query}) async {

    emit(SearchLoading());

    final regionId = SharedPrefHelper.getString(key: 'region');

    final result = await _searchUseCase(
      ProductParams(
        limit: 50,
        offset: 0,
        reginId: regionId!,
        fields:
        "id,title,description,thumbnail,*variants.calculated_price",
        query: null,
      ),
    );

    result.result.fold(
          (failure) {
        emit(SearchFailure(failure.toString()));
      },
          (data) {
        final searchProduct =
        data.products!.where((e)=>e.title?.toLowerCase().
        contains(query!.toLowerCase())??false).toList();
        emit(SearchSuccess(searchProduct: searchProduct, ));
      },
    );
  }}


