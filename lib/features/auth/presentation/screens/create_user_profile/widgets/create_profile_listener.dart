import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/utils/extension.dart';
import 'package:my_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:my_store/features/auth/presentation/cubit/auth_state.dart';

import '../../../../../../core/utils/routing/routers.dart';

class CreateProfileListener extends StatelessWidget {
  const CreateProfileListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
      current is RegisterLoading ||
          current is RegisterSuccess ||
          current is RegisterError,
      listener: (context, state) {
        if (state is RegisterLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is RegisterSuccess) {

          context.pop();

          context.pushNamedAndRemoveUntil(Routers.bottomNav);
        } else if (state is RegisterError) {

          context.pop();

          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              content: Text(state.message),
            ),
          );
        }
      },
      child: const SizedBox(),
    );
  }
}