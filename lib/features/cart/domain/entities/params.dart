class DeleteCartParams {
  final String cartId;
  final String lineId;

  DeleteCartParams(this.cartId, this.lineId);
}

class AddCartRequest {
  final String cartId;
  final Map<String, dynamic> body;

  AddCartRequest(this.cartId, this.body);
}

class UpdateCartParams {
  final String cartId;
  final String lineId;
  final Map<String, dynamic> body;


  UpdateCartParams(this.cartId, this.lineId,  this.body);
}

class AddShippingOptionParams {
  final String cartId;
  final Map<String, dynamic> body;
  AddShippingOptionParams(this.cartId, this.body);
}


class CreateAddressParams {
  final String firstName;
  final String lastName;
  final String address1;
  final String? address2;
  final String city;
  final String countryCode;
  final String? phone;

  CreateAddressParams({
    required this.firstName,
    required this.lastName,
    required this.address1,
    this.address2,
    required this.city,
    required this.countryCode,
    this.phone,
  });
}
class ShippingAddressCartRequest {
  final String cartId;
  final ShippingAddressRequest body;

  ShippingAddressCartRequest({
    required this.cartId,
    required this.body,
  });
}
class ShippingAddressRequest {
  final String firstName;
  final String lastName;
  final String address1;
  final String city;
  final String countryCode;

  ShippingAddressRequest({
    required this.firstName,
    required this.lastName,
    required this.address1,
    required this.city,
    required this.countryCode,
  });


}