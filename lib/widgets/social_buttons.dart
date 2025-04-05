import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String icon;
  final bool isApple;

  const SocialButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.isApple = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 56,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xffE2725B)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child:
            isApple
                ? const Icon(Icons.apple, size: 24, color: Color(0xffE2725B))
                : Text(
                  icon,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffE2725B),
                  ),
                ),
      ),
    );
  }
}
