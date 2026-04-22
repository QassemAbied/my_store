import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/services/shared_pref.dart';
import '../../../../../../core/utils/extension.dart';
import '../../../../../../core/utils/routing/routers.dart';
import '../../../../../cart/presentation/cubit/cart_cubit.dart';
import '../../../controller/payment_cubit.dart';
import '../../../controller/payment_state.dart';

class BlocListenerPayment extends StatelessWidget {
  const BlocListenerPayment({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {

    return BlocListener<PaymentCubit, PaymentState>(
        listenWhen: (previous, current) =>
        current is PaymentCollectionSuccess ||
            current is PaymentSessionSuccess ||
            current is PaymentProcessing||
            current is PaymentSuccessState ||
            current is PaymentErrorState,
      listener: (context, state) async{

        if (state is PaymentCollectionSuccess) {
          context.read<PaymentCubit>().createSession();
        }

        if (state is PaymentSessionSuccess) {

          context.read<PaymentCubit>().confirmPayment(
            state.session.clientSecret,
          );
        }

        if (state is PaymentProcessing) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) =>
            const Center(child: CircularProgressIndicator()),
          );
        }

        if (state is PaymentSuccessState) {
          await context.read<CartCubit>().clearCart();

            Navigator.pop(context);


          context.pushNamedAndRemoveUntil(Routers.success,
              arguments: state.orderId);
        }

        if (state is PaymentErrorState) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }

      },
      child:child ,
    );

  }

}
