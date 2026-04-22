class PaymentIntentInputRequest {
  final int amount;
  final String currency;

  PaymentIntentInputRequest({required this.amount, required this.currency});

  Map<String, dynamic> toJson() {
    return {'amount': amount, 'currency': currency};
  }
}
