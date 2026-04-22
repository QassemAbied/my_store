import 'package:flutter/material.dart';
import 'package:my_store/core/utils/spacing.dart';
import 'package:my_store/features/address/presentation/screen/widgets/add_new_address_widget.dart';
import '../../../cart/presentation/screens/step.dart';
import 'address_body.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Addresses")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            StepHeader(currentStep: 1, totalSteps: 4),
            AddNewAddressWidget(),
            verticalSpace(20),
            Expanded(child: AddressBody()),
          ],
        ),
      ),
    );
  }
}
