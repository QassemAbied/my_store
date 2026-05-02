import 'package:flutter/material.dart';
import '../../../../../core/theme/color_extension.dart';
import '../../../../address/presentation/screen/widgets/add_new_address_widget.dart';
import 'address_settings_body.dart';

class AddressSettingScreen extends StatelessWidget {
  const AddressSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(title: const Text("My Addresses")),

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showAddAddressSheet(context);
            },
            backgroundColor: context.primaryColor,
            child: const Icon(Icons.location_on),
          ),

          body: AddressSettingsBody(),
        );
      },
    );
  }
}
