import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theme/color_extension.dart';
import '../../../../../../core/utils/app_text_style.dart';
import '../../../../../../core/utils/extension.dart';
import '../../../../../../core/utils/routing/routers.dart';
import '../../../../../bottom_nav_bar/controller/bottom_nav_cubit.dart';

class EmptyOrdersWidget extends StatelessWidget {
  const EmptyOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            /// 🛒 ICON
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: context.primaryColor.withValues(alpha: .1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 60,
                color: context.primaryColor,
              ),
            ),

            const SizedBox(height: 20),

            /// 🔥 TITLE
            Text(
              "No Orders Yet",
              style: AppTextStyle.bold(
                fontSize: 20,
                color: context.textPrimary,
              ),
            ),

            const SizedBox(height: 10),

            /// 🧠 SUBTITLE
            Text(
              "Looks like you haven't placed any orders yet.",
              textAlign: TextAlign.center,
              style: AppTextStyle.regular(
                fontSize: 14,
                color: context.textSecondary,
              ),
            ),

            const SizedBox(height: 20),

            /// 🚀 BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.read<BottomNavCubit>().changeBottomNavIndex(0);
                  context.pushNamedAndRemoveUntil(Routers.bottomNav);
                },
                child: const Text("Start Shopping"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}