import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/address/presentation/screen/widgets/address_list_view_widget.dart';
import 'package:my_store/features/address/presentation/screen/widgets/empty_address_widget.dart';
import 'package:my_store/features/shipping/presentation/controller/shipping_cubit.dart';
import '../../../../injection_container.dart';
import '../../../shipping/presentation/screen/widget/shipping_address_listener.dart';
import '../controller/address_cubit.dart';
import '../controller/address_state.dart';

class AddressBody extends StatelessWidget {
  const AddressBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ShippingAddressListener(
      child: BlocBuilder<AddressCubit, AddressState>(
        builder: (context, state) {
          if (state is AddressLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AddressSuccess) {
            if (state.addresses.addresses.isEmpty) {
              return EmptyAddressWidget();
            }

            return AddressListViewWidget(addresses: state.addresses,);
          }
          if (state is AddressError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
