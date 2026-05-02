import 'package:flutter/material.dart';
import 'package:my_store/features/orders/presentation/screen/order_history/order_history_body.dart';


class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Orders",
        ),
      ),

      body:OrderHistoryBody(),
    );
  }
}
