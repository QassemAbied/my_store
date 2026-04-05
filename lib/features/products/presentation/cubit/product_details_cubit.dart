import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/products/domain/entities/product_details_request.dart';
import 'package:my_store/features/products/presentation/cubit/product_details_state.dart';

import '../../domain/usecases/get_products_details.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final GetProductsDetailsUseCase getProductsDetailsUseCase;

  ProductDetailsCubit(this.getProductsDetailsUseCase)
    : super(ProductDetailsInitial());

  Future<void> getProductDetails(String id) async {
    emit(ProductDetailsLoading());
    final result = await getProductsDetailsUseCase.call(
      ProductDetailsRequest(
        "id,title,description,thumbnail,collection.title,categories.name,images.url,options.title,options.values.value",
        id,
      ),
    );
    result.result.fold(
      (failure) => emit(ProductDetailsFailure(failure.toString())),
      (data) => emit(ProductDetailsSuccess(data)),
    );
  }
}
