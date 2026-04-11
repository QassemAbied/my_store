import 'package:flutter/material.dart';
import '../theme/color_extension.dart';
import '../utils/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final int? minLines;
  final int? maxLines;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final Widget? suffix;
  final bool? enabled;
  final bool? isPassword;
  final bool? autofocus;
  final String? helperText;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.textInputType,
    this.controller,
    this.suffix,
    this.isPassword,
    this.validator,
    this.autofocus,
    this.helperText,
    this.labelText,
    this.enabled,
    this.minLines,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus ?? false,
      enabled: enabled ?? true,
      keyboardType: textInputType,
      controller: controller,
      maxLines: maxLines,
      minLines: minLines,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        helperText: helperText,
        labelText: labelText,
        isDense: true,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 20,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffix,
        hintText: hintText,
        hintStyle: AppTextStyle.regular(
          fontSize: 20.0,
          color: context.disabled,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: context.border, width: 1.3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: context.primaryColor, width: 1.3),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: context.warning, width: 1.3),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: context.error, width: 1.3),
        ),
      ),
      validator: validator,
    );
  }
}
