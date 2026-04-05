import 'dart:convert';
import 'package:my_store/core/error/failures.dart';
import 'package:my_store/core/services/shared_pref.dart';
import 'package:my_store/features/cart/domain/entities/cart_item.dart';
import 'package:my_store/features/cart/domain/entities/params.dart';
import 'package:my_store/features/cart/domain/entities/shipping_entites.dart';
import 'package:my_store/features/cart/domain/repository.dart';
import '../../../core/network/api_result.dart';
import '../domain/mappers/cart_item_mapper.dart';
import '../domain/mappers/shipping_mapper.dart';
import 'data_source/cart_remote_data_source.dart';
import 'models/cart_id_model.dart';
import 'models/regions_model.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource _cartRemoteDataSource;
  CartRepositoryImpl(this._cartRemoteDataSource);
  @override
  Future<ApiResult<String>> getRegions() async {
    try {
      final res = await _cartRemoteDataSource.getRegions();
      final model = RegionResponseModel.fromJson(jsonDecode(res));
      final regionId = model.regions.first.id;
      await SharedPrefHelper.setData(key: "regionId", value: regionId);
      return ApiResult.success(regionId);
    } catch (failure) {
      return ApiResult.failure(ServerFailure());
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
    } catch (failure) {
      return ApiResult.failure(ServerFailure());
    }
  }

  @override
  Future<ApiResult<CartResponseEntity>> getCartItems(String id) async {
    try {
      final res = await _cartRemoteDataSource.getCartItems(id);
      final cartResponseEntity = CartMapper.toResponseEntity(res);
      return ApiResult.success(cartResponseEntity);
    } catch (failure) {
      return ApiResult.failure(ServerFailure());
    }
  }

  @override
  Future<ApiResult<void>> addToCart(AddCartRequest request) async {
    try {
      final res = await _cartRemoteDataSource.addToCart(request);
      return ApiResult.success(res);
    } catch (failure) {
      return ApiResult.failure(ServerFailure());
    }
  }

  @override
  Future<ApiResult<void>> deleteCartItem(DeleteCartParams params) async {
    try {
      final res = await _cartRemoteDataSource.deleteCartItem(params);
      return ApiResult.success(res);
    } catch (failure) {
      return ApiResult.failure(ServerFailure());
    }
  }

  @override
  Future<ApiResult<void>> updateCartItem(UpdateCartParams params) async {
    try {
      final res = await _cartRemoteDataSource.updateCartItem(params);
      return ApiResult.success(res);
    } catch (failure) {
      return ApiResult.failure(ServerFailure());
    }
  }

  @override
  Future<ApiResult<ShippingEntity>> getShippingOptions(String cartId)async {
    try {
      final res = await _cartRemoteDataSource.getShippingOptions(cartId);
      final shippingEntity = ShippingMapper.toEntity(res);
      return ApiResult.success(shippingEntity);
    } catch (failure) {
      return ApiResult.failure(ServerFailure());
    }
  }
}
