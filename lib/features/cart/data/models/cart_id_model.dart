class CartIdModel {
  final String id;

  CartIdModel({required this.id});

  factory CartIdModel.fromJson(Map<String, dynamic> json) {
    return CartIdModel(
      id: json['cart']['id'],
    );
  }
}