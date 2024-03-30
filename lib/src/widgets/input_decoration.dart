import 'package:flutter/material.dart';

InputDecoration inputDecoration({
  required String hintText,
  Widget? suffixIcon,
  Widget? prefixIcon,
  double? radius,
}) {
  return InputDecoration(
    filled: true,
    fillColor: const Color(0XFF29374F),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    hintText: hintText,
    hintStyle: const TextStyle(
      color: Color(0XFF959DAE),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(radius ?? 16),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(radius ?? 16),
      ),
      borderSide: const BorderSide(
        color: Colors.black,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(radius ?? 16),
      ),
      borderSide: const BorderSide(
        color: Colors.black,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(radius ?? 16),
      ),
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    ),
  );
}
