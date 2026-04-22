import '../../data/models/payment_session_model.dart';
import '../../domain/entities/payment_session.dart';

extension PaymentSessionMapper on PaymentSessionResponseModel {
  PaymentSession toEntity() {
    final session = paymentCollection.paymentSessions.first;

    return PaymentSession(
      id: session.id,
      clientSecret: session.data.clientSecret,
      amount: session.data.amount,
    );
  }
}
