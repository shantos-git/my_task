import 'package:flutter/material.dart';

class CustomSelectField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final VoidCallback? onTap;
  final String value;

  const CustomSelectField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F7FF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      value.isEmpty ? hintText : value,
                      style: TextStyle(
                        color: value.isEmpty
                            ? Colors.grey.shade500
                            : Colors.black87,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFF6D7A97),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
