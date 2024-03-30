import 'package:flutter/material.dart';

class EmptyChatItem extends StatelessWidget {
  const EmptyChatItem({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 16,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0XFF111728),
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
      ),
    );
  }
}