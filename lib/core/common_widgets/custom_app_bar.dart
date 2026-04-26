import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/search/search_screen.dart';
import 'package:my_store/core/theme/app_colors.dart';
import 'package:my_store/core/theme/color_extension.dart';
import 'package:my_store/core/utils/app_text_style.dart';

import '../../features/cart/presentation/cubit/cart_cubit.dart';
import '../../features/cart/presentation/cubit/cart_state.dart';
import '../utils/extension.dart';
import '../utils/routing/routers.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final GlobalKey cartKey;
  const CustomAppBar({super.key, required this.title, required this.cartKey});


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:  Text(title,style: AppTextStyle.bold(
          fontSize: 20.0, color: context.primaryColor),),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  SearchScreen()) );
          },
          icon: const Icon(Icons.search)),

        CartIconWithBadge(cartKey: cartKey),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CartIconWithBadge extends StatelessWidget {
  final GlobalKey cartKey;

  const CartIconWithBadge({super.key, required this.cartKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        int count = 0;

        if (state is CartItemsSuccess) {
          count = state.cartResponseEntity.cart.items.length;
        }

        return Stack(
          key: cartKey,
          children: [
            IconButton(
              icon:  Icon(Icons.shopping_cart),
              onPressed: () {
                context.pushNamed(Routers.cart);
              },
            ),

            if (count > 0)
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.success,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: Text(
                    "$count",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

