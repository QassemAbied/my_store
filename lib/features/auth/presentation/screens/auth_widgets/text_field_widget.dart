import 'package:flutter/material.dart';
import 'package:my_store/core/utils/extension.dart';
import '../../../../../core/common_widgets/custom_text_form_field.dart';
import '../../../../../core/theme/color_extension.dart';
import '../../../../../core/utils/spacing.dart';

class TextFieldWidget extends StatelessWidget {
 const TextFieldWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hintText: "Email",
          textInputType: TextInputType.emailAddress,
          prefixIcon: Icon(Icons.email,color: context.disabled,),
          controller: emailController,
          validator: (value) {
            if (value?.isEmpty ?? false) {
              return "Enter email";
            }
            return null;
          },
        ),
        verticalSpace(20),
        CustomTextFormField(
          hintText: "Password",
          textInputType: TextInputType.visiblePassword,
          prefixIcon: Icon(Icons.lock,color: context.disabled,),
          controller: passwordController,
          validator: (value) {
            if (value?.isEmpty ?? false || value!.length < 6) {
              return "Min 6 chars";
            }
            return null;
          },
        ),
        verticalSpace(30),
      ],
    );
  }
}

// if (_formKey.currentState!.validate()) {
// context.read<AuthCubit>().logon(
// LoginRequest(
// email: emailController.text,
// password: passwordController.text,
// ),
// );
// }
