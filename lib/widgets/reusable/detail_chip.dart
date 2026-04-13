import 'package:flutter/material.dart';

class DetailChip extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;

  const DetailChip({
    super.key,
    required this.label,
    this.backgroundColor = const Color.fromARGB(255, 174, 176, 255),
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }
}
