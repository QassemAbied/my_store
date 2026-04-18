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





