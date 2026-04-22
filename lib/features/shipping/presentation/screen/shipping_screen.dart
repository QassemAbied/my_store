import 'package:flutter/material.dart';
import 'package:my_store/core/utils/spacing.dart';
import 'package:my_store/features/shipping/presentation/screen/shipping_body.dart';
import '../../../cart/presentation/screens/step.dart';

class ShippingScreen extends StatelessWidget {
  const ShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shipping")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            StepHeader(currentStep: 2, totalSteps: 4),
            verticalSpace(10),
            ShippingBody(),
          ],
        ),
      ),
    );
  }
}
