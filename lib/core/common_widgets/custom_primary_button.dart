import 'package:flutter/material.dart';


class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.isIcon = false,
  });

  final VoidCallback? onPressed;
  final String text;
  final Widget? icon;
  final bool isIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: isIcon
          ? ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon!,
        label: Text(text),
      )
          : ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}