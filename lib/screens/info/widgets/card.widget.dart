import 'package:flutter/material.dart';

class GestureCard extends StatelessWidget {
  final String imagePath;
  final String description;
  const GestureCard(
      {required this.imagePath, required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300, width: 1),
          color: Colors.white),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: 40,
          ),
          const SizedBox(
            width: 16,
          ),
          Flexible(
            child: Text(
              description,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.blueGrey.shade700,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
