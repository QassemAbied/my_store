import 'package:flutter/material.dart';
import 'cart_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
        ),
      ),

      body: CartBody(),
    );
  }
}
