import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/address/presentation/controller/address_cubit.dart';
import 'package:my_store/features/address/presentation/controller/address_state.dart';

import '../../../../../core/utils/extension.dart';

class AddAddressListener extends StatelessWidget {
  const AddAddressListener({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
      return BlocListener<AddressCubit, AddressState>(
      listenWhen: (previous, current) =>
      current is AddAddressLoading ||
          current is AddAddressSuccess ||
          current is AddAddressError,
      listener: (context, state) async{
        if (state is AddAddressLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state is AddAddressSuccess)  {
          context.pop();
          context.pop();
        } else if (state is AddAddressError) {
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
