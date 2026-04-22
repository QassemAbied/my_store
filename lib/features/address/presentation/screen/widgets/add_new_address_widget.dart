import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/common_widgets/custom_primary_button.dart';
import 'package:my_store/core/common_widgets/custom_text_form_field.dart';
import 'package:my_store/core/theme/app_colors.dart';
import 'package:my_store/core/theme/color_extension.dart';
import 'package:my_store/core/utils/extension.dart';
import 'package:my_store/core/utils/spacing.dart';
import 'package:my_store/features/address/presentation/screen/widgets/add_address_listener.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../domain/entities/address_request.dart';
import '../../controller/address_cubit.dart';

class AddNewAddressWidget extends StatelessWidget {
  const AddNewAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: () async {
          await showAddAddressSheet(context);
        },
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            AppColors.disabled.withValues(alpha: 0.7),
          ),
        ),
        icon: Icon(Icons.add),
        label: Text("Add New Address"),
      ),
    );
  }
}

Future<void> showAddAddressSheet(BuildContext context) async {
  final cubit = context.read<AddressCubit>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final address1 = TextEditingController();
  final address2 = TextEditingController();
  final city = TextEditingController();
  final phone = TextEditingController();
  final form = GlobalKey<FormState>();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return BlocProvider.value(
        value: cubit,
        child: AddAddressListener(
          child: DraggableScrollableSheet(
            initialChildSize: 0.8,
            maxChildSize: 0.9,
            expand: false,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Form(
                  key: form,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 16,
                      left: 16,
                      right: 16,
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text(
                            "Address details",
                            style: AppTextStyle.bold(
                              fontSize: 18,
                              color: context.textPrimary,
                            ),
                          ),
                          subtitle: Text(
                            "complete address Would assist better us in serving you",
                            maxLines: 2,
                            style: AppTextStyle.regular(
                              fontSize: 16,
                              color: context.textSecondary,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () => context.pop(),
                            icon: const Icon(Icons.close),
                          ),
                        ),

                        verticalSpace(10),

                        _field("First Name", firstName, TextInputType.name),
                        _field("Last Name", lastName, TextInputType.name),
                        _field(
                          "Address1",
                          address1,
                          TextInputType.streetAddress,
                        ),
                        _field(
                          "Address2",
                          address2,
                          TextInputType.streetAddress,
                        ),
                        _field("City", city, TextInputType.streetAddress),
                        _field("Phone", phone, TextInputType.phone),

                        verticalSpace(20),
                        CustomElevatedButton(
                          onPressed: () {
                            if (form.currentState!.validate()) {
                              context.read<AddressCubit>().addAddress(
                                CreateAddressParams(
                                  firstName: firstName.text,
                                  lastName: lastName.text,
                                  address1: address1.text,
                                  city: city.text,
                                  countryCode: "gb",
                                  phone: phone.text,
                                ),
                              );
                            }
                          },
                          text: "Save Address",
                        ),
                        verticalSpace(10),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    },
  );
}

Widget _field(
  String hint,
  TextEditingController controller,
  TextInputType textInputType,
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: CustomTextFormField(
      textInputType: textInputType,
      controller: controller,
      hintText: hint,
      validator: (value) {
        if (value?.isEmpty ?? false) {
          return "Please enter $hint";
        }
        return null;
      },
    ),
  );
}
