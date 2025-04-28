import 'package:flutter/material.dart';

class DietaryTags extends StatelessWidget {
  const DietaryTags({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildTag(Icons.eco, 'Veg', Colors.green),
        const SizedBox(width: 16),
        _buildTag(Icons.restaurant, 'Non-Veg', Colors.red),
        const SizedBox(width: 16),
        _buildTag(Icons.spa, 'Gluten Free', Colors.amber),
      ],
    );
  }

  Widget _buildTag(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: color,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
