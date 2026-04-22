import 'package:flutter/material.dart';
import 'package:my_store/core/utils/spacing.dart';
import '../../../../../../core/theme/color_extension.dart';
import '../../../../../../core/utils/app_text_style.dart';

class DummyPaymentWidget extends StatelessWidget {
  const DummyPaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [context.primaryColor, context.secondaryColor],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payment Method",
                style: AppTextStyle.medium(fontSize: 16, color: Colors.white),
              ),

              verticalSpace(10),

              Row(
                children: [
                  Icon(Icons.credit_card, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "VISA •••• 4242",
                    style: AppTextStyle.bold(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),

              verticalSpace(10),

              Text(
                "Expires 12/26",
                style: AppTextStyle.regular(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
