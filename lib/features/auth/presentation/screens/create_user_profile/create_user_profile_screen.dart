import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../../../cart/presentation/cubit/cart_cubit.dart';
import '../../cubit/auth_cubit.dart';
import 'create_user_profile_body.dart';

class CreateUserProfileScreen extends StatelessWidget {
  const CreateUserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthCubit>()),
        BlocProvider(create: (_) => sl<CartCubit>()),
      ],
      child: CreateUserProfileBody(),
    );
  }
}
