import 'dart:convert';
import 'package:my_store/core/services/shared_pref.dart';
import 'package:my_store/features/cart/data/data_source/local_data_source/cart_local_data_source.dart';
import 'package:my_store/features/cart/domain/entities/cart_item.dart';
import 'package:my_store/features/cart/domain/entities/params.dart';
import 'package:my_store/features/cart/domain/mappers/cart_local_mapper.dart';
import 'package:my_store/features/payment/domain/entities/payment_provider_entities.dart';
import 'package:my_store/features/cart/domain/repository.dart';
import '../../../core/error/error_handler.dart';
import '../../../core/network/api_result.dart';
import '../domain/mappers/cart_item_mapper.dart';
import '../../payment/domain/mappers/payment_provider_mapper.dart';
import 'data_source/remote_data_source/cart_remote_data_source.dart';
import 'models/cart_id_model.dart';
import 'models/regions_model.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource _cartRemoteDataSource;
  final CartLocalDataSource _localDataSource;
  CartRepositoryImpl(
      this._cartRemoteDataSource,
      this._localDataSource,
      );
  @override
  Future<ApiResult<String>> getRegions() async {
    try {
      final res = await _cartRemoteDataSource.getRegions();
      final model = RegionResponseModel.fromJson(jsonDecode(res));
      final regionId = model.regions.first.id;
      await SharedPrefHelper.setData(key: "regionId", value: regionId);
      return ApiResult.success(regionId);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<String>> createCart(Map<String, dynamic> body) async {
    try {
      final savedCartId = SharedPrefHelper.getString(key: "cartId");

      if (savedCartId != null) {
        return ApiResult.success(savedCartId);
      }
      final res = await _cartRemoteDataSource.createCart(body);
      final model = CartIdModel.fromJson(jsonDecode(res));
      final id = model.id;
      await SharedPrefHelper.setData(key: "cartId", value: id);
      return ApiResult.success(id);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
  @override
  Future<ApiResult<CartResponseEntity>>
  getCartItems(String id) async {
    try {
      final cachedCart =
      await _localDataSource
          .getCartItemsLocal(id);
      final localEntity =
      CartLocalMapper
          .toLocalEntity(cachedCart);
      return ApiResult.success(localEntity);

    } catch (_) {}

    try {

      final res =
      await _cartRemoteDataSource
          .getCartItems(id);

      final cartResponseEntity =
      CartMapper.toResponseEntity(res);

      final cartEntityLocal =
      CartLocalMapper
          .toLocalModel(res);

      await _localDataSource
          .cacheCartItemsLocal(
        cartEntityLocal,
        id,
      );

      return ApiResult.success(
          cartResponseEntity);

    } catch (e) {

      return ApiResult.failure(
        ErrorHandler.handle(e),
      );
    }
  }

  @override
  Future<ApiResult<void>> addToCart(AddCartRequest request) async {

    try {
      final res = await _cartRemoteDataSource.addToCart(request);
      return ApiResult.success(res);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<void>> deleteCartItem(DeleteCartParams params) async {
    try {
      final res = await _cartRemoteDataSource.deleteCartItem(params);
      return ApiResult.success(res);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<void>> updateCartItem(UpdateCartParams params) async {
    try {
      final res = await _cartRemoteDataSource.updateCartItem(params);
      return ApiResult.success(res);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }



  @override
  Future<ApiResult<void>> completeCart(String cartId) async {
    try {
      await _cartRemoteDataSource.completeCart(cartId);
      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }




  @override
  Future<ApiResult<PaymentProvidersResponseEntity>>
  getPaymentProviders(String regionId) async{
    try {
      final res = await _cartRemoteDataSource.getPaymentProviders( regionId);
      final paymentProvidersResponseEntity = PaymentProvidersMapper.toEntity(res);
      return ApiResult.success(paymentProvidersResponseEntity);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
