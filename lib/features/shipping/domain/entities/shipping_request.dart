class AddShippingOptionParams {
  final String cartId;
  final Map<String, dynamic> body;
  AddShippingOptionParams(this.cartId, this.body);
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