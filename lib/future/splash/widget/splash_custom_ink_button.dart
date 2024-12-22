import 'package:flutter/material.dart';

class SplashCustomInkButton extends StatelessWidget {
  const SplashCustomInkButton({
    required this.onTap,
    required this.text,
    super.key,
    this.cardColor = Colors.red,
    this.textColor = Colors.red,
  });

  final VoidCallback onTap;
  final Color? cardColor;
  final Color? textColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: cardColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
