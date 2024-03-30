import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    this.onPressed,
    required this.label,
    required this.backgroundColor,
  });

  final VoidCallback? onPressed;
  final Widget label;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      if (states.any((e) => e == MaterialState.disabled)) {
        return const Color(0xFF4B4DED).withOpacity(0.3);
      }

      return backgroundColor;
    }

    return SizedBox(
      height: 64,
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
          ),
          backgroundColor: MaterialStateProperty.resolveWith(getColor),
        ),
        child: label,
      ),
    );
  }
}
