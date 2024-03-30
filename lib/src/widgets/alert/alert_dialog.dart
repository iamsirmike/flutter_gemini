import 'package:flutter/material.dart';
import 'package:map_chat/src/widgets/button/custom_button.dart';

Future showAlertDialog(
  BuildContext context,
  String message, {
  void Function()? onPressed,
  String? lableText,
  required String imagePath,
  String? subtext,
}) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0XFF29374F),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40.0),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath),
            const SizedBox(
              height: 10,
            ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0XFFffffff),
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            if (subtext != null) ...[
              const SizedBox(
                height: 20,
              ),
              Text(
                subtext,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0XFFffffff),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
            const SizedBox(
              height: 30,
            ),
            PrimaryButton(
              onTap: onPressed ??
                  () {
                    Navigator.of(context).pop();
                  },
              lableText: lableText ?? 'Ok',
            ),
          ],
        ),
      );
    },
  );
}
