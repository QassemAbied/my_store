import 'package:flutter/material.dart';

import '../theme/color_extension.dart';

class CustomAnimatedContainerWidget extends StatelessWidget {
  const CustomAnimatedContainerWidget({super.key, required this.child,
     this.selected=false,});
  final Widget child;
final   bool selected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color:selected? context.primaryColor: context.border,
            width: 1.5),
        boxShadow: [
          BoxShadow(
            color: context.textPrimary.withValues(alpha: 0.5),
            blurRadius: 5,
          ),
        ],
      ),

      child: child,
    );
  }
}
