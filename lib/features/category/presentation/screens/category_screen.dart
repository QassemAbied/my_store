import 'package:flutter/material.dart';
import 'package:my_store/features/category/presentation/screens/category_body.dart';
import '../../../../core/common_widgets/custom_app_bar.dart';
import '../../../../core/theme/color_extension.dart';


class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});
  final GlobalKey cartKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Product', cartKey: cartKey),
      body: CategoryBody(cartKey: cartKey),
    );
  }
}
