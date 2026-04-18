import 'package:my_store/features/shipping/data/data_source/remote_data_source.dart';
import '../../../../core/network/rest_client.dart';
import '../../../cart/data/models/cart_item_model.dart';
import '../../domain/entities/shipping_request.dart';
import '../models/shipping_model.dart';


class ShippingRemoteDataSourceImpl implements ShippingRemoteDataSource{
  final RestClient _restClient;

  ShippingRemoteDataSourceImpl(this._restClient);
  @override
  Future<ShippingResponseModel> getShippingOptions(String cartId) async {
    return await _restClient.getShippingOptions(cartId);
  }

  @override
  Future<void> addShippingOptions(AddShippingOptionParams params) async {
    return await _restClient.addShippingMethod(params.cartId, params.body);
  }
  @override
  Future<CartResponseModel> addShippingAddress(
      ShippingAddressCartRequest request)async {
    return await _restClient.addShippingAddress(
        request.cartId,
        {
          "shipping_address": {
            "first_name": request.body.firstName,
            "last_name":  request.body.lastName,
            "address_1":  request.body.address1,
            "city":  request.body.city,
            "country_code":  request.body.countryCode,
          }
        }
    );
  }


}