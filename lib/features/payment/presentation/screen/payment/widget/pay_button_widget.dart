import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/common_widgets/custom_primary_button.dart';
import '../../../controller/payment_cubit.dart';
import '../../../controller/payment_state.dart';

class PayButtonWidget extends StatelessWidget {
  const PayButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        return CustomElevatedButton(
          text: " Pay Now 💳",
          onPressed: () {
            context.read<PaymentCubit>().createPaymentCollection();
          },
        );
      },
    );
  }
}
