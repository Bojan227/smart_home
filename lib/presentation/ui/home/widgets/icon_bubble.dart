import 'package:flutter/material.dart';

class IconBubble extends StatelessWidget {
  const IconBubble({
    super.key,
    required this.icon,
    required this.color,
  });

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(62),
        color: color.withOpacity(0.1),
      ),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }
}
