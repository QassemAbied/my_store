import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/utils/extension.dart';
import 'package:my_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:my_store/features/auth/presentation/cubit/auth_state.dart';

import '../../../../../../core/utils/routing/routers.dart';

class LoginBlocConsumer extends StatelessWidget {
  const LoginBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
      current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginError,
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is LoginSuccess) {

            context.pop();

          context.pushNamedAndRemoveUntil(Routers.bottomNav);
        } else if (state is LoginError) {

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