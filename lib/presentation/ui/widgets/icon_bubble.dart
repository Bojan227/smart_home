import 'package:flutter/material.dart';

class IconBubble extends StatelessWidget {
  const IconBubble({
    super.key,
    required this.icon,
    required this.color,
    this.bubbleColor,
  });

  final IconData icon;
  final Color color;
  final Color? bubbleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(62),
        color: bubbleColor ?? color.withOpacity(0.1),
      ),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }
}
