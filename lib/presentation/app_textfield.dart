import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final bool obscurepaswd;

  const AppTextField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.validator,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    this.obscurepaswd = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscurepaswd,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: suffixIcon,
        ),
        suffixIconConstraints: const BoxConstraints(
          minHeight: 10,
          minWidth: 20,
        ),
        fillColor: const Color(0xffFCFDFE),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        isDense: true,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Color(
              0xffF0F1F7,
            ),
          ),
        ),
        hintText: hintText,
        hintStyle: smallGreyText,
      ),
    );
  }
}
