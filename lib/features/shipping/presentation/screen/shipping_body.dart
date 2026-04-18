import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/shipping/presentation/screen/widget/add_shipping_options_listener.dart';
import 'package:my_store/features/shipping/presentation/screen/widget/shipping_list_item_widget.dart';
import 'package:my_store/features/shipping/presentation/screen/widget/shipping_list_view_widget.dart';
import '../controller/shipping_cubit.dart';
import '../controller/shipping_state.dart';

class ShippingBody extends StatelessWidget {
  const ShippingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: BlocBuilder<ShippingCubit, ShippingState>(
        builder: (context, state) {

          if (state is ShippingLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ShippingSuccess ||
              state is AddShippingLoading ||
              state is AddShippingSuccess ||
              state is AddShippingError) {
            final cubit = context.read<ShippingCubit>();
            final list = cubit.shippingData?.options ?? [];

            return AddShippingOptionsListener(child:
            ShippingListViewWidget(list: list,));
          }
          if (state is ShippingError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
