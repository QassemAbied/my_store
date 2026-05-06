import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/products/presentation/screens/product_details_body.dart';
import 'package:my_store/features/products/presentation/screens/widgets/add_to_card_button_widget.dart';
import '../../../../core/theme/color_extension.dart';
import '../../../cart/presentation/cubit/cart_cubit.dart';
import '../cubit/product_details_cubit.dart';
import '../cubit/product_details_state.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.surfaceColor,
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProductDetailsFailure) {
            return Center(child: Text(state.message));
          }

          if (state is ProductDetailsSuccess) {
            final product = state.productDetailsEntities;

            context.read<ProductDetailsCubit>().initSelectedVariant(
              product,
              context.read<CartCubit>(),
            );


            return ProductDetailsBody(product: product);
          }

          return const SizedBox();
        },
      ),
      bottomNavigationBar:
          BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
            builder: (context, state) {
              if (state is ProductDetailsSuccess) {
                return AddToCartButton(product: state.productDetailsEntities);
              }
              return const SizedBox();
            },
          ),
    );
  }
}




