import '../../../orders/domain/entitiy/order_review_entities.dart';
import '../../domain/entities/payment_collection.dart';
import '../../domain/entities/payment_provider_entities.dart';
import '../../domain/entities/payment_session.dart';

class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}
final class PaymentSuccess extends PaymentState {}
final class PaymentError extends PaymentState {
  final String error;

  PaymentError(this.error);
}

class PaymentProviderLoading extends PaymentState {}
class PaymentProviderSuccess extends PaymentState {
  final PaymentProvidersResponseEntity data;

  PaymentProviderSuccess(this.data);
}
class PaymentProviderError extends PaymentState {
  final String message;

  PaymentProviderError(this.message);
}

class PaymentCollectionLoading extends PaymentState {}
class PaymentCollectionSuccess extends PaymentState {
  final PaymentCollection data;

  PaymentCollectionSuccess(this.data);
}
class PaymentCollectionError extends PaymentState {
  final String message;

  PaymentCollectionError(this.message);
}

class PaymentSessionLoading extends PaymentState {}
class PaymentSessionSuccess extends PaymentState {
  final PaymentSession session;

  PaymentSessionSuccess(this.session);
}
class PaymentSessionError extends PaymentState {
  final String message;

  PaymentSessionError(this.message);
}

class PaymentProcessing extends PaymentState {}
class PaymentSuccessState extends PaymentState {
  final String orderId;

  PaymentSuccessState(this.orderId);
}
class PaymentErrorState extends PaymentState {
  final String message;

  PaymentErrorState(this.message);
}



class PaymentCancelledState extends PaymentState {}
