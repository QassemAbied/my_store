import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/utils/extension.dart';
import 'package:my_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:my_store/features/auth/presentation/cubit/auth_state.dart';

import '../../../../../../core/utils/routing/routers.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
      current is RegisterAuthLoading ||
          current is RegisterAuthSuccess ||
          current is RegisterAuthError,
      listener: (context, state) {
        if (state is RegisterAuthLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is RegisterAuthSuccess) {

          context.pop();

          context.pushNamedAndRemoveUntil(Routers.login);
        } else if (state is RegisterAuthError) {

          context.pop();

          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              content: Text(state.message),
            ),
          );
        }
      },
      child: child,
    );
  }
}