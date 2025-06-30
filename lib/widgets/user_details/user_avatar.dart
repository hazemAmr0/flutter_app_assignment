import 'package:flutter/material.dart';
import 'gradient_utils.dart';

class UserAvatar extends StatelessWidget {
  final String name;
  final double size;

  const UserAvatar({
    Key? key,
    required this.name,
    this.size = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: GradientUtils.getGradientColors(name),
        ),
      ),
      child: Center(
        child: Text(
          name.isNotEmpty ? name[0].toUpperCase() : '?',
          style: TextStyle(
            fontSize: size * 0.4,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
