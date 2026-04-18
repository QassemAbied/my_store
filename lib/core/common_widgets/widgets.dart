import 'package:flutter/material.dart';

import '../theme/color_extension.dart';

class CommonWidget{
 static Widget selectedItem(bool selected, BuildContext context ){
    return Icon(
      selected
          ? Icons.check_box
          : Icons.check_box_outline_blank,
      color: selected
          ? context.primaryColor
          : context.disabled,
    );
  }

  static Widget leadingIcon( BuildContext context ,IconData icon){
  return  Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: context.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: context.primaryColor),
    );
  }


}