import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../address/presentation/controller/address_cubit.dart';
import '../../../../address/presentation/controller/address_state.dart';
import '../../../../address/presentation/screen/widgets/address_list_item_widget.dart';
import '../../../../address/presentation/screen/widgets/empty_address_widget.dart';

class AddressSettingsBody extends StatelessWidget {
  const AddressSettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        if (state is AddressLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is AddressError) {
          return Center(child: Text(state.message));
        }

        if (state is AddressSuccess) {
          if (state.addresses.addresses.isEmpty) {
            return EmptyAddressWidget();
          }
          final list = state.addresses.addresses;

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: list.length,
            separatorBuilder: (_, _) => verticalSpace(16),
            itemBuilder: (_, index) {
              final isSelected =
                  index == context.watch<AddressCubit>().selectedIndex;
              return GestureDetector(
                onTap: () {
                  context.read<AddressCubit>().selectAddress(index);
                },
                child: AddressListItemWidget(
                  item: list[index],
                  index: index,
                  selected: isSelected,
                ),
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
