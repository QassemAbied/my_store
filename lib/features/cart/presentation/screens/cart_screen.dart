import 'package:flutter/material.dart';
import 'package:my_store/core/theme/color_extension.dart';
import '../../../../core/utils/app_text_style.dart';
import 'cart_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: AppTextStyle.bold(fontSize: 20, color: context.textPrimary),
        ),
      ),

      body: CartBody(),
    );
  }
}
