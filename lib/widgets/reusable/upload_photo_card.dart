import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class UploadPhotoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onChooseFile;

  const UploadPhotoCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onChooseFile,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      dashPattern: [10, 10],
      radius: const Radius.circular(20),
      color: Colors.grey.shade300,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/image_1.png',
              width: 60,
              height: 60,
            ),
            const SizedBox(height: 14),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
            ),
            const SizedBox(height: 18),
            GestureDetector(
              onTap: onChooseFile,
              child: Container(
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F7FF),
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: const Color(0xFF2565FF)),
                ),
                child: const Center(
                  child: Text(
                    'Choose a file',
                    style: TextStyle(
                      color: Color(0xFF2565FF),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
