import 'package:flutter_stripe/flutter_stripe.dart';
class PaymentCancelledException implements Exception {}
class StripeService {
  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'My Store',
      ),
    );
  }

  Future<void> disPlayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } on StripeException catch (e) {
      throw PaymentCancelledException(); // 👈 بدل string
    } catch (e) {
      throw Exception("Payment error");
    }
  }
}
