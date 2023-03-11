import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.keyboardType,
      required this.textInputAction,
      this.obscureText,
      this.color,
      required this.validate,
      required this.validateString,
      required this.textCapitalization});

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool? obscureText;
  final Color? color;
  final bool validate;
  final String validateString;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textCapitalization: textCapitalization,
      obscureText: obscureText ?? false,
      textInputAction: textInputAction,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        errorText: validate ? validateString : null,
        label: Text(hintText),
        labelStyle: TextStyle(color: color ?? const Color(0xFF172B4D), fontFamily: "Rubik Regular"),
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFE5E5E5)),
          borderRadius: BorderRadius.all(
            Radius.circular(8.sp),
          ),
        ),
      ),
    );
  }
}
