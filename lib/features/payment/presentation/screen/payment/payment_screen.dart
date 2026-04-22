import 'package:flutter/material.dart';
import 'package:my_store/features/payment/presentation/screen/payment/payment_body.dart';
import 'package:my_store/features/payment/presentation/screen/payment/widget/bloc_listener_payment.dart';
import '../../../../cart/presentation/screens/step.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListenerPayment(
      child: Scaffold(
        appBar: AppBar(title: const Text("Payment")),

        body: Column(
          children: [
            StepHeader(currentStep: 3, totalSteps: 4),
            Expanded(child: PaymentBody()),
          ],
        ),
      ),
    );
  }
}
