import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/common_widgets/custom_animated_container_widget.dart';
import 'package:my_store/core/theme/color_extension.dart';
import 'package:my_store/core/utils/app_text_style.dart';
import 'package:my_store/core/utils/spacing.dart';
import '../../../../../core/common_widgets/widgets.dart';
import '../../../domain/entities/shipping_entites.dart';
import '../../controller/shipping_cubit.dart';

class ShippingListItemWidget extends StatelessWidget {
  const ShippingListItemWidget({super.key,
    required this.item,
  });
  final ShippingOptionEntity item;


  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ShippingCubit>();
    final selected= cubit.selectedId==item.id;
    return GestureDetector(
      onTap: (){

        cubit.setSelectedId(item.id);
      },
      child: CustomAnimatedContainerWidget(
        selected: selected,
        child: Row(
          children: [
            CommonWidget.leadingIcon(context, Icons.local_shipping),
            horizontalSpace(10),

           // verticalSpace( 12),

            infoText(item,context),
            priceAndCheck(item ,context, selected)
          ],
        ),
      ),
    );
  }


}

Expanded infoText(ShippingOptionEntity item,BuildContext context) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            item.name,
            style: AppTextStyle.bold(
                fontSize: 16, color: context.textPrimary)
        ),
        verticalSpace( 4),
        Text(
            item.description ?? "",
            style: AppTextStyle.bold(
                fontSize: 14, color: context.textSecondary)
        ),
        verticalSpace( 4),
        Text(
            item.currencyCode ?? "",
            style: AppTextStyle.bold(
                fontSize: 14, color: context.textSecondary)
        ),

      ],
    ),
  );
}
Column priceAndCheck(ShippingOptionEntity item,BuildContext context, bool selected)
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [

      Text(
          "${item.amount} €",
          style: AppTextStyle.bold(
              fontSize: 15, color: context.textPrimary)
      ),

      verticalSpace(6),

      CommonWidget.selectedItem(selected, context),
    ],
  );
}

