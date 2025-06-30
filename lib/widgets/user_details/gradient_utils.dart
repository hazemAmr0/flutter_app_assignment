import 'package:flutter/material.dart';

class GradientUtils {
  static List<Color> getGradientColors(String name) {
    final colors = [
      [const Color(0xFFFF9A9E), const Color(0xFFFECFEF)], // Pink
      [const Color(0xFFA18CD1), const Color(0xFFFBC2EB)], // Purple
      [const Color(0xFFFFD3A5), const Color(0xFFFD9853)], // Orange
      [const Color(0xFFFFE259), const Color(0xFFFFA751)], // Yellow
      [const Color(0xFF667eea), const Color(0xFF764ba2)], // Blue
      [const Color(0xFF48CAE4), const Color(0xFF0077B6)], // Cyan
      [const Color(0xFF00F5FF), const Color(0xFF0077B6)], // Light Blue
      [const Color(0xFFA8E6CF), const Color(0xFF7FCDCD)], // Green
    ];
    
    int index = name.hashCode.abs() % colors.length;
    return colors[index];
  }
}
