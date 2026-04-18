import 'package:my_store/features/shipping/data/models/shipping_model.dart';

import '../../../cart/data/models/cart_item_model.dart';
import '../../domain/entities/shipping_request.dart';


abstract class ShippingRemoteDataSource {
  Future<ShippingResponseModel> getShippingOptions(String cartId);
  Future<void> addShippingOptions(AddShippingOptionParams params);
  Future<CartResponseModel> addShippingAddress(
      ShippingAddressCartRequest request,
      );
}