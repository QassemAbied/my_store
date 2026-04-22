
import '../../data/models/payment_provider_model.dart';
import '../entities/payment_provider_entities.dart';

class PaymentProvidersMapper {
  static PaymentProvidersResponseEntity toEntity(
      PaymentProvidersResponseModel model) {
    return PaymentProvidersResponseEntity(
      paymentProviders: model.paymentProviders
          .map((e) => toProviderEntity(e))
          .toList(),
      count: model.count,
      offset: model.offset,
      limit: model.limit,
    );
  }

  static PaymentProviderEntity toProviderEntity(
      PaymentProviderModel model) {
    return PaymentProviderEntity(
      id: model.id,
      isEnabled: model.isEnabled,
    );
  }
}