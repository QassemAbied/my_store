import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/shipping/presentation/screen/widget/shipping_list_item_widget.dart';

import '../../../../../core/common_widgets/custom_primary_button.dart';
import '../../../domain/entities/shipping_entites.dart';
import '../../controller/shipping_cubit.dart';

class ShippingListViewWidget extends StatelessWidget {
  const ShippingListViewWidget({super.key, required this.list});
 final List<ShippingOptionEntity> list;
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ShippingCubit>();
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];

              return ShippingListItemWidget(
                item: item,
              );
            },
          ),
        ),
        CustomElevatedButton(
          onPressed:cubit.selectedId==null? null: () {
            context.read<ShippingCubit>().addShippingOptions(
                shippingOptionId: cubit.selectedId!);
          },
          text: 'Continue to Payment',
        ),

      ],
    );
  }
}
