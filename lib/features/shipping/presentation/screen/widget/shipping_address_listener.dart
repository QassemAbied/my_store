import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/shipping/presentation/controller/shipping_cubit.dart';
import '../../../../../core/utils/extension.dart';
import '../../../../../core/utils/routing/routers.dart';
import '../../controller/shipping_state.dart';

class ShippingAddressListener extends StatelessWidget {
  const ShippingAddressListener({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShippingCubit, ShippingState>(
      listenWhen: (previous, current) =>
          current is AddShippingAddressLoading ||
          current is AddShippingAddressSuccess ||
          current is AddShippingAddressError,
      listener: (context, state)  {
        if (state is AddShippingAddressLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state is AddShippingAddressSuccess) {
          //context.pop();
          context.pushNamed(Routers.shipping);
        } else if (state is AddShippingAddressError) {
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
