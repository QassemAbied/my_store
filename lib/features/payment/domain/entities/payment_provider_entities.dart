class PaymentProvidersResponseEntity {
  final List<PaymentProviderEntity> paymentProviders;
  final int count;
  final int offset;
  final int limit;

  PaymentProvidersResponseEntity({
    required this.paymentProviders,
    required this.count,
    required this.offset,
    required this.limit,
  });
}

class PaymentProviderEntity {
  final String id;
  final bool isEnabled;

  PaymentProviderEntity({
    required this.id,
    required this.isEnabled,
  });
}