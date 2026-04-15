import 'package:flutter/material.dart';
import 'package:my_store/core/theme/color_extension.dart';
import 'package:my_store/core/utils/app_text_style.dart';
import 'package:my_store/core/utils/spacing.dart';


class EmptyAddressWidget extends StatelessWidget {
  const EmptyAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: context.primaryColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child:  Icon(
                Icons.location_on_outlined,
                size: 60,
                color:context.primaryColor,
              ),
            ),

            verticalSpace( 20),
             Text(
              "No Addresses Yet",
              style: AppTextStyle.bold(fontSize: 18, color: context.textPrimary),
            ),
            verticalSpace( 10),
             Text(
              "Add your first address to start ordering",
              textAlign: TextAlign.center,
              style:  AppTextStyle.regular(fontSize: 16, color: context.textSecondary),
            ),

          ],
        ),
      ),
    );
  }
}