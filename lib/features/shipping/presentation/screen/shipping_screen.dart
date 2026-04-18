import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/utils/spacing.dart';
import 'package:my_store/features/shipping/presentation/screen/shipping_body.dart';
import '../../../../core/common_widgets/custom_primary_button.dart';
import '../../../cart/presentation/cubit/cart_cubit.dart';
import '../../../cart/presentation/cubit/cart_state.dart';
import '../../../cart/presentation/screens/step.dart';
class ShippingScreen extends StatefulWidget {

  const ShippingScreen({super.key, });


  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shipping"),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            StepHeader(currentStep: 2, totalSteps: 4,),
            verticalSpace(10),
            ShippingBody(),

            // Padding(
            //   padding: const EdgeInsets.all(16),
            //   child: ElevatedButton(
            //     onPressed: (){},
            //     // onPressed: selectedId == null ? null : () {
            //     //   Navigator.pushNamed(context, "/payment");
            //     // },
            //     child: const Text("Continue to Payment"),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

