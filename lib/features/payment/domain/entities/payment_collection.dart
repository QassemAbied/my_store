class PaymentCollectionResponseEntity {
  final PaymentCollection paymentCollection;

  const PaymentCollectionResponseEntity({required this.paymentCollection});
}

class PaymentCollection {
  final String id;
  final String currencyCode;
  final int amount;

  PaymentCollection({
    required this.id,
    required this.currencyCode,
    required this.amount,
  });
}
