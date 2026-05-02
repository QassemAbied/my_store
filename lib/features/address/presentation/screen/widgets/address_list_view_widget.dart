import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shipping/domain/entities/shipping_request.dart';
import '../../../../shipping/presentation/controller/shipping_cubit.dart';
import '../../../domain/entities/address_entities.dart';
import '../../controller/address_cubit.dart';
import 'address_list_item_widget.dart';

class AddressListViewWidget extends StatelessWidget {
  const AddressListViewWidget({super.key, required this.addresses});
  final AddressResponseEntity addresses;

  @override
  Widget build(BuildContext context) {
    final list = addresses.addresses.reversed.toList();
    final cubit = context.watch<AddressCubit>();

    return ListView.builder(
      itemCount: list.length,

      itemBuilder: (context, index) {
        final item = list[index];
        final selected = cubit.selectedIndex == index;

        return GestureDetector(
            onTap: () {
              cubit.selectAddress(index);
              context.read<ShippingCubit>().addShippingAddress( body:
              ShippingAddressRequest(
              firstName: item.firstName ?? '',
              lastName: item.lastName ?? '',
              address1: item.address1 ?? '',
              city: item.city ?? '',
              countryCode: item.countryCode ?? '',
              ),
);
            },
            child: AddressListItemWidget(item: item, index: index, selected: selected,));
      },
    );
  }
}
