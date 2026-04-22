class PaymentIntentEntity {
  final String id;
  final int amount;
  final String currency;
  final String status;
  final String clientSecret;

  PaymentIntentEntity({
    required this.id,
    required this.amount,
    required this.currency,
    required this.status,
    required this.clientSecret,
  });
}
