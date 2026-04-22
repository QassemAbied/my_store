import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/extension.dart';
import '../../../../../core/utils/routing/routers.dart';
import '../../controller/shipping_cubit.dart';
import '../../controller/shipping_state.dart';

class AddShippingOptionsListener extends StatelessWidget {
  const AddShippingOptionsListener({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShippingCubit, ShippingState>(
      listenWhen: (previous, current) =>
          current is AddShippingLoading ||
          current is AddShippingSuccess ||
          current is AddShippingError,
      listener: (context, state) async {
        if (state is AddShippingLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state is AddShippingSuccess) {
          context.pop();
          context.pushNamed(Routers.payment);
        } else if (state is AddShippingError) {
          context.pop();
          showDialog(
            context: context,
            builder: (_) => AlertDialog(content: Text(state.message)),
          );
        }
      },
      child: child,
    );
  }
}
