import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/services/shared_pref.dart';
import 'package:my_store/core/utils/extension.dart';
import 'package:my_store/core/utils/routing/routers.dart';
import 'package:my_store/core/utils/spacing.dart';
import 'package:my_store/features/auth/domain/entities/requests.dart';
import 'package:my_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:my_store/features/auth/presentation/screens/auth_widgets/welcome_widget.dart';
import 'package:my_store/features/auth/presentation/screens/login/widget/login_bloc_listener.dart';
import '../../../../../core/common_widgets/custom_primary_button.dart';
import '../auth_widgets/text_button.dart';
import '../auth_widgets/text_field_widget.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WelcomeWidget(
                    title: "Welcome Back 👋",
                      subTitle: 'Login to your account'),
                  verticalSpace(30),
                  TextFieldWidget(
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  CustomElevatedButton(
                    text: "Login",
                    onPressed: () async{
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().login(
                          LoginRequest(
                            email: emailController.text.trim(),
                            password: passwordController.text,
                          ),

                        );
                        if(emailController.text.isNotEmpty){
                          await SharedPrefHelper.setData(
                              key: 'email', value: emailController.text);
                        }

                      }
                    },
                  ),
                  verticalSpace(30),
                  PrimaryButton(
                    text: "Don't have an account? Register",
                    onPressed: () {
                      context.pushNamed(Routers.register);
                    },
                  ),

                  LoginBlocConsumer(),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
