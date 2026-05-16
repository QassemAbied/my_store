import 'package:flutter/material.dart';
import 'package:my_store/core/common_widgets/custom_app_bar.dart';
import 'package:my_store/core/utils/extension.dart';
import 'package:my_store/core/utils/routing/routers.dart';
import 'home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey cartKey = GlobalKey();

    return Scaffold(
      appBar: CustomAppBar(title: 'Product', cartKey: cartKey),
      body: SafeArea(child: HomeBody(cartKey: cartKey)),
      floatingActionButton: ElevatedButton(onPressed: ()async{
        context.pushNamed(Routers.ai);

      },
          child: Icon(Icons.chat)),
    );
  }
}
