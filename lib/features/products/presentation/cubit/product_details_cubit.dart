import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/products/domain/entities/product_details_request.dart';
import 'package:my_store/features/products/presentation/cubit/product_details_state.dart';
import '../../../cart/presentation/cubit/cart_cubit.dart';
import '../../domain/entities/product_details_entities.dart';
import '../../domain/usecases/get_products_details.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final GetProductsDetailsUseCase getProductsDetailsUseCase;


  ProductDetailsCubit(this.getProductsDetailsUseCase,)
    : super(ProductDetailsInitial());

  String? selectedSize;
  String? selectedColor;
  ProductVariantEntities? selectedVariant;

  void selectSize(String size, ProductDetailsEntities product) {
    selectedSize = size;
    _updateVariant(product);
  }

  void selectColor(String color, ProductDetailsEntities product) {
    selectedColor = color;
    _updateVariant(product);
  }

  void _updateVariant(ProductDetailsEntities product) {
    final hasColor = product.product.options.any(
      (e) => e.title.toLowerCase() == "color",
    );
    if (hasColor) {
      if (selectedSize == null || selectedColor == null) {
        selectedVariant = null;
        emit(ProductDetailsSuccess(product));
        return;
      }

      try {
        selectedVariant = product.product.variants.firstWhere(
          (v) =>
              v.options.any((o) => o.value == selectedSize) &&
              v.options.any((o) => o.value == selectedColor),
        );
      } catch (_) {
        selectedVariant = null;
      }
    } else {
      if (selectedSize == null) {
        selectedVariant = null;
        emit(ProductDetailsSuccess(product));
        return;
      }

      try {
        selectedVariant = product.product.variants.firstWhere(
          (v) => v.options.any((o) => o.value == selectedSize),
        );
      } catch (_) {
        selectedVariant = null;
      }
    }

    emit(ProductDetailsSuccess(product));
  }

  void initSelectedVariant(ProductDetailsEntities product, CartCubit cart) {
    final cartItems = cart.items?.cart.items ?? [];

    for (final item in cartItems) {
      final foundList = product.product.variants
          .where((v) => v.id == item.variantId)
          .toList();
      if (foundList.isNotEmpty) {
        final found = foundList.first;
        selectedVariant = found;
        final values = found.options.map((e) => e.value).toList();
        selectedSize = values.isNotEmpty ? values.first : null;
        selectedColor = values.length > 1 ? values[1] : null;
        emit(ProductDetailsSuccess(product));
        return;
      }
    }
  }

  Future<void> getProductDetails(String id) async {
    emit(ProductDetailsLoading());
    final result = await getProductsDetailsUseCase.call(
      ProductDetailsRequest(
        "id,title,description,thumbnail,collection.title,categories.name,images.url,options.title,options.values.value,variants.id,variants.title,variants.sku,variants.options.value",
        id,
      ),
    );
    result.result.fold(
      (failure) => emit(ProductDetailsFailure(failure.message)),
      (data) {
        emit(ProductDetailsSuccess(data));
      },
    );
  }



}
