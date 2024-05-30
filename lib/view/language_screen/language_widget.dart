import 'package:flutter/material.dart';

class CustomLanguage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;

  CustomLanguage({
    required this.title,
    required this.subtitle,
    required this.text,
    required this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 4,
        color: isSelected ? Colors.red : Colors.white,
        child: Container(
          width: 160,
          height: 130,
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: isSelected
                      ? Colors.white
                      : Colors.black, // Conditional color
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                subtitle,
                style: TextStyle(
                  color: isSelected
                      ? Colors.white
                      : Colors.black38, // Conditional color
                  fontSize: 14.0,
                ),
              ),
              // Spacer(),
              Text(
                text,
                style: TextStyle(
                  color: isSelected
                      ? Colors.white
                      : Colors.black26, // Conditional color
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
