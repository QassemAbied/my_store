import 'package:flutter/material.dart';
import 'package:my_store/features/auth/presentation/screens/create_user_profile/widgets/create_user_form.dart';

import '../auth_widgets/welcome_widget.dart';

class CreateUserProfileBody extends StatefulWidget {
  const CreateUserProfileBody({super.key});

  @override
  State<CreateUserProfileBody> createState() => _CreateUserProfileBodyState();
}

class _CreateUserProfileBodyState extends State<CreateUserProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(child:
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeWidget(
                title: 'Create your profile 👋',
                subTitle: 'Create your profile to get started',

              ),
              const CreateUserForm(),
            ],
          ),
        ),)),
    );
  }
}
