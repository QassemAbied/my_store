import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/theme/app_colors.dart';
import 'package:my_store/core/theme/color_extension.dart';
import 'package:my_store/core/utils/app_text_style.dart';
import 'package:my_store/core/utils/spacing.dart';

import '../../../domain/entities/address_entities.dart';
import '../../controller/address_cubit.dart';

class AddressListItemWidget extends StatelessWidget {
  const AddressListItemWidget({super.key, required this.item, required this.index});
  final AddressEntity item;
  final int index;
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AddressCubit>();

    final selected = cubit.selectedIndex == index;
    return Stack(
      children: [
        GestureDetector(
          onTap: () {

            cubit.selectAddress(index);

            // context.read<AddressCubit>().addShippingAddress(
            //   body: ShippingAddressRequest(
            //     firstName: e.firstName ?? '',
            //     lastName: e.lastName ?? '',
            //     address1: e.address1 ?? '',
            //     city: e.city ?? '',
            //     countryCode: e.countryCode ?? '',
            //   ),
            // );
          },

          child: Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: context.surfaceColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  color:selected? context.primaryColor: context.border,
                  width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: context.textPrimary.withValues(alpha: 0.5),
                  blurRadius: 5,
                ),
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                nameAndIcon(context, item, selected),
                verticalSpace(10),
                Text(
                  item.address1 ?? "",
                  style: AppTextStyle.bold(
                    fontSize: 12,
                    color: context.textSecondary,
                  ),
                ),
                verticalSpace(6),
                Text(
                  item.phone ?? "",
                  style: AppTextStyle.bold(
                    fontSize: 12,
                    color: context.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: (){
              cubit.deleteAddress(item.id);
            },
            child:Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.error.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.delete, color: AppColors.error, size:20),
            ),
          ))
      ],
    );
  }
}

Widget nameAndIcon(BuildContext context, AddressEntity item, bool selected) {
  return Row(
    children: [
      Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: context.primaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(Icons.home, color: context.primaryColor, size: 20),
      ),

      horizontalSpace(10),

      Expanded(
        child: Text(
          item.firstName ?? "Home",
          style: AppTextStyle.bold(fontSize: 16, color: context.primaryColor),
        ),
      ),

      Icon(
        selected
            ? Icons.check_box
            : Icons.check_box_outline_blank,
        color: selected
            ? context.primaryColor
            : context.disabled,
      ),
    ],
  );
}
