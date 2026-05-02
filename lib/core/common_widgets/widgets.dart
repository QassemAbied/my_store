import 'package:flutter/material.dart';

import '../theme/color_extension.dart';

class CommonWidget {
  static Widget selectedItem(bool selected, BuildContext context) {
    return Icon(
      selected ? Icons.check_box : Icons.check_box_outline_blank,
      color: selected ? context.primaryColor : context.disabled,
    );
  }

  static Widget leadingIcon({
    required BuildContext context,
    required IconData icon,
    Color? iconColor,
    Color? backgroundIconColor,
  })
  {
    final iconClr = iconColor ?? context.primaryColor;
    final bgClr =
        backgroundIconColor ?? context.primaryColor.withValues(alpha: 0.1);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgClr,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: iconClr),
    );
  }

  static String formatDate(String date) {
    final d = DateTime.parse(date);
    return "${d.day}/${d.month}/${d.year}";
  }

  static Widget statusDot(BuildContext context, String status) {
    Color color;

    switch (status) {
      case "pending":
        color = context.warning;
        break;
      case "completed":
        color = context.success;
        break;
      default:
        color = context.error;
    }

    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  static String mapStatus(String status) {
    switch (status.toLowerCase()) {
      case "pending":
        return "Processing";
      case "completed":
        return "Delivered";
      case "canceled":
        return "Canceled";
      default:
        return status;
    }
  }
}
