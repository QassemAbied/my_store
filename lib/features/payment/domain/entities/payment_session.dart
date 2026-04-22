class PaymentSession {
  final String id;
  final String clientSecret;
  final int amount;

  PaymentSession({
    required this.id,
    required this.clientSecret,
    required this.amount,
  });
}
