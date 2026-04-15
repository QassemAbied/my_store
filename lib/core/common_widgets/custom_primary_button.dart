import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
   CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,  this.icon,  this.isIcon=false,
  });
  final VoidCallback onPressed;
  final String text;
   Widget? icon;
 final bool isIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
        child: ElevatedButton.icon(
            onPressed: onPressed,
            icon:isIcon==false? SizedBox(): icon,
            label: Text(text),),
    );
  }
}
