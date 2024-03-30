import 'package:flutter/material.dart';
import 'package:map_chat/src/widgets/input_decoration.dart';

class AiTextFormField extends StatelessWidget {
  const AiTextFormField({
    super.key,
    this.onChanged,
    this.onSaved,
    this.validator,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.maxLines,
    this.keyboardType,
    this.controller,
    this.radius,
  });
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      controller: controller,
      maxLines: maxLines,
      keyboardType: TextInputType.multiline,
      obscureText: obscureText,
      style: const TextStyle(
        color: Colors.white,
      ),
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return "This text field is required";
            }
            return null;
          },
      decoration: inputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        radius: radius,
      ),
    );
  }
}
