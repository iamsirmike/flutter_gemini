import 'package:flutter/material.dart';
import 'package:map_chat/src/widgets/button/base_button.dart';

// class PrimaryButton extends StatelessWidget {
//   const PrimaryButton({Key? key, required this.onTap, required this.label}) : super(key: key);
//   final Function() onTap;
//   final String label;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         onTap();
//       },
//       child: Container(
//         height: 56,
//         width: double.infinity,
//         decoration:
//             BoxDecoration(borderRadius: BorderRadius.circular(10), color: LiteColors.primaryColor),
//         child: Center(
//           child: Text(
//             label,
//             style: const TextStyle(
//                 fontSize: 14, fontWeight: FontWeight.w700, color: LiteColors.whiteColor),
//           ),
//         ),
//       ),
//     );
//   }
// }

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onTap,
    this.label,
    required this.lableText,
    this.color = const Color(0XFF324EFF),
    this.disabled = false,
  });

  final VoidCallback? onTap;
  final bool disabled;
  final Widget? label;
  final String lableText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onPressed: onTap,
      label: label ??
          Text(
            lableText,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
          ),
      backgroundColor:
          disabled ? const Color(0xFF4B4DED).withOpacity(0.3) : color,
    );
  }
}

class OutlinedWashButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color? borderColor;
  final Color? textColor;

  const OutlinedWashButton({
    super.key,
    this.onPressed,
    required this.label,
    this.borderColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    const color = Color(0xffD6D6D6);

    return SizedBox(
      height: 56,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(
                color: onPressed != null
                    ? (borderColor ?? const Color(0XFF324EFF))
                    : color),
          ),
        ),
        child: Text(
          label,
          style: themeData.textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.normal,
            color: onPressed == null
                ? color
                : (textColor ?? const Color(0XFF324EFF)),
          ),
        ),
      ),
    );
  }
}
