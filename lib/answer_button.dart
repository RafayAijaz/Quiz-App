import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.text, required this.onTap, super.key});

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          backgroundColor: const Color.fromARGB(255, 49, 4, 121),
          foregroundColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
