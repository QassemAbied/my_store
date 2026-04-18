import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/auth/domain/entities/requests.dart';
import 'package:my_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:my_store/features/auth/presentation/screens/register/widget/register_bloc_listener.dart';
import '../../../../../core/common_widgets/custom_primary_button.dart';
import '../../../../../core/utils/extension.dart';
import '../../../../../core/utils/routing/routers.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../injection_container.dart';
import '../auth_widgets/text_button.dart';
import '../auth_widgets/text_field_widget.dart';
import '../auth_widgets/welcome_widget.dart';


class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
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
    return RegisterBlocListener(
      child: Scaffold(
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
                        title: "Create Account 🚀",
                        subTitle: "Register to get started"),
                    verticalSpace(30),
                    TextFieldWidget(
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
      
                    CustomElevatedButton(
                      text: "Register",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().registerAuth(
                            LoginRequest(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                        }
                      },
                    ),
                    verticalSpace(30),
                    PrimaryButton(
                      text: "Already have an account? Login",
                      onPressed: () {
                        context.pushNamed(Routers.login);
                      },
                    ),
                   
      
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}