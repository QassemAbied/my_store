import '../../data/models/payment_collection_model.dart';
import '../../domain/entities/payment_collection.dart';

extension PaymentCollectionResponseMapper on PaymentCollectionResponse {
  PaymentCollectionResponseEntity toEntity() {
    return PaymentCollectionResponseEntity(
      paymentCollection: paymentCollection.toEntity(),
    );
  }
}

/// =============================
/// 🔁 Model → Entity
/// =============================
extension PaymentCollectionModelMapper on PaymentCollectionModel {
  PaymentCollection toEntity() {
    return PaymentCollection(
      id: id,
      currencyCode: currencyCode,
      amount: amount,
    );
  }
}
