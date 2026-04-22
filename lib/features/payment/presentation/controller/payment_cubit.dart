import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/payment/presentation/controller/payment_state.dart';
import '../../../../core/services/shared_pref.dart';
import '../../../../core/services/stripe_service.dart';
import '../../domain/use_case/payment_provider_use_case.dart';
import '../../domain/entities/payment_collection.dart';
import '../../domain/entities/payment_session_input.dart';
import '../../domain/use_case/complete_order_use_case.dart';
import '../../domain/use_case/payment_collection_use_case.dart';
import '../../domain/use_case/payment_provider_use_case.dart';
import '../../domain/use_case/payment_session_use_case.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentSessionUseCase _createSession;
  final CreatePaymentCollectionUseCase _createPaymentCollectionUseCase;
  final CompleteOrderUseCase _completeOrder;
  final PaymentProviderUseCase _paymentProviderUseCase;
  final StripeService _stripeService;

  PaymentCubit(
    this._createSession,
    this._completeOrder,
    this._createPaymentCollectionUseCase,
    this._paymentProviderUseCase,
    this._stripeService,
  ) : super(PaymentInitial());

  String? cartId;
  String? regionId;
  PaymentCollection? _paymentCollection;
  Future<void> paymentProvider() async {
    emit(PaymentProviderLoading());

    regionId ??= SharedPrefHelper.getString(key: 'region');

    if (regionId == null) {
      emit(PaymentProviderError("regionId is null"));
      return;
    }

    final result = await _paymentProviderUseCase(regionId!);

    result.result.fold(
      (failure) => emit(PaymentProviderError(failure.toString())),
      (data) => emit(PaymentProviderSuccess(data)),
    );
  }

  Future<void> createPaymentCollection() async {
    emit(PaymentCollectionLoading());

    cartId ??= SharedPrefHelper.getString(key: 'cartId');

    if (cartId == null) {
      emit(PaymentCollectionError("Cart Id is null"));
      return;
    }

    final result = await _createPaymentCollectionUseCase(cartId!);

    result.result.fold(
      (failure) => emit(PaymentCollectionError(failure.toString())),
      (data) {
        _paymentCollection = data.paymentCollection;

        emit(PaymentCollectionSuccess(data.paymentCollection));
      },
    );
  }

  Future<void> createSession() async {
    emit(PaymentSessionLoading());

    if (_paymentCollection == null) {
      emit(PaymentSessionError("paymentCollection is null"));
      return;
    }

    final result = await _createSession(
      PaymentSessionInput(
        paymentId: _paymentCollection!.id,
        providerId: 'pp_stripe_stripe',
      ),
    );

    result.result.fold(
      (failure) => emit(PaymentSessionError(failure.toString())),
      (data) => emit(PaymentSessionSuccess(data)),
    );
  }

  Future<void> confirmPayment(String clientSecret) async {
    try {
      emit(PaymentProcessing());
      print("init start");
      await _stripeService.initPaymentSheet(
        paymentIntentClientSecret: clientSecret,
      );
      print("init done");
      await _stripeService.disPlayPaymentSheet();
      print("sheet opened");
      cartId ??= SharedPrefHelper.getString(key: 'cartId');
      if (cartId == null) {
        emit(PaymentErrorState("Cart Id is null"));
        return;
      }

      final result = await _completeOrder(cartId!);

      result.result.fold(
        (failure) {
          emit(PaymentErrorState(failure.toString()));
        },
        (data) async {
          final orderId = data.id;

          emit(PaymentSuccessState(orderId));
        },
      );

    } on PaymentCancelledException {
      emit(PaymentCancelledState());
    }catch (e) {
      emit(PaymentErrorState("Payment failed: $e"));
    }
  }
}
