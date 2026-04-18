import 'package:flutter/material.dart';
import '../../../domain/entities/address_entities.dart';
import 'address_list_item_widget.dart';

class AddressListViewWidget extends StatelessWidget {
  const AddressListViewWidget({super.key, required this.addresses});
  final AddressResponseEntity addresses;

  @override
  Widget build(BuildContext context) {
    final list = addresses.addresses.reversed.toList();
    return ListView.builder(
      itemCount: list.length,

      itemBuilder: (context, index) {
        final item = list[index];
        return AddressListItemWidget(item: item, index: index,);
      },
    );
  }
}
