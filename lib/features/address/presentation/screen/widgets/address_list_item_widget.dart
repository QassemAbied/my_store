import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/common_widgets/custom_animated_container_widget.dart';
import 'package:my_store/core/common_widgets/widgets.dart';
import 'package:my_store/core/theme/app_colors.dart';
import 'package:my_store/core/theme/color_extension.dart';
import 'package:my_store/core/utils/app_text_style.dart';
import 'package:my_store/core/utils/spacing.dart';
import 'package:my_store/features/shipping/presentation/controller/shipping_cubit.dart';
import '../../../../shipping/domain/entities/shipping_request.dart';
import '../../../domain/entities/address_entities.dart';
import '../../controller/address_cubit.dart';

class AddressListItemWidget extends StatelessWidget {
  const AddressListItemWidget({
    super.key,
    required this.item,
    required this.index,
  });
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
            context.read<ShippingCubit>().addShippingAddress(
              body: ShippingAddressRequest(
                firstName: item.firstName ?? '',
                lastName: item.lastName ?? '',
                address1: item.address1 ?? '',
                city: item.city ?? '',
                countryCode: item.countryCode ?? '',
              ),
            );
          },

          child: CustomAnimatedContainerWidget(
            selected: selected,
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
            onTap: () {
              cubit.deleteAddress(item.id);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.error.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.delete, color: AppColors.error, size: 20),
            ),
          ),
        ),
      ],
    );
  }
}

Widget nameAndIcon(BuildContext context, AddressEntity item, bool selected) {
  return Row(
    children: [
      CommonWidget.leadingIcon(context, Icons.home),

      horizontalSpace(10),

      Expanded(
        child: Text(
          item.firstName ?? "Home",
          style: AppTextStyle.bold(fontSize: 16, color: context.primaryColor),
        ),
      ),

      CommonWidget.selectedItem(selected, context),
    ],
  );
}
