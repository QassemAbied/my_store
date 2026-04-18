import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/auth/domain/entities/requests.dart';
import '../../../../../../core/common_widgets/custom_primary_button.dart';
import '../../../../../../core/common_widgets/custom_text_form_field.dart';
import '../../../../../../core/theme/color_extension.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../cubit/auth_cubit.dart';
import 'create_profile_listener.dart';

class CreateUserForm extends StatefulWidget {
  const CreateUserForm({super.key});

  @override
  State<CreateUserForm> createState() => _CreateUserFormState();
}

class _CreateUserFormState extends State<CreateUserForm> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final countryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CreateProfileListener(
      child: Form(
        key: _formKey,
        child: Column(
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
              hintText: "First Name",
              textInputType: TextInputType.name,
              prefixIcon: Icon(Icons.drive_file_rename_outline,color: context.disabled,),
              controller: firstNameController,
              validator: (value) {
                if (value?.isEmpty ?? false ) {
                  return "Enter first name";
                }
                return null;
              },
            ),
            verticalSpace(20),
            CustomTextFormField(
              hintText: "Last Name",
              textInputType: TextInputType.name,
              prefixIcon: Icon(Icons.drive_file_rename_outline_rounded,color: context.disabled,),
              controller: lastNameController,
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return "Enter Last Name";
                }
                return null;
              },
            ),
            verticalSpace(20),
            CustomTextFormField(
              hintText: "Phone",
              textInputType: TextInputType.phone,
              prefixIcon: Icon(Icons.phone,color: context.disabled,),
              controller: phoneController,
              validator: (value) {
                if (value?.isEmpty ?? false ) {
                  return "Enter Phone";
                }
                return null;
              },
            ),
            verticalSpace(20),
            CustomTextFormField(
              hintText: "Country",
              textInputType: TextInputType.streetAddress,
              prefixIcon: Icon(Icons.countertops,color: context.disabled,),
              controller: countryController,
              validator: (value) {
                if (value?.isEmpty ?? false ) {
                  return "Enter Country";
                }
                return null;
              },
            ),
            verticalSpace(30),
            CustomElevatedButton(
              text: "Create Profile",
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AuthCubit>().createProfile(
                    RegisterRequest(
                      email: emailController.text,
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      phone: phoneController.text,
                      country: countryController.text,
                    ),
                  );
                }
              }, icon: null,
            ),
            verticalSpace(30),
          ],
        ),
      ),
    );
  }
}
