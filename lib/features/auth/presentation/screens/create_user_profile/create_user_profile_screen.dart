import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../cubit/auth_cubit.dart';
import 'create_user_profile_body.dart';

class CreateUserProfileScreen extends StatelessWidget {
  const CreateUserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: CreateUserProfileBody(),
    );
  }
}
