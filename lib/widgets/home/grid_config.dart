import 'package:flutter/material.dart';

class GridConfig {
  final int crossAxisCount;
  final double childAspectRatio;
  final double spacing;
  final EdgeInsets padding;

  const GridConfig({
    required this.crossAxisCount,
    required this.childAspectRatio,
    required this.spacing,
    required this.padding,
  });

  static GridConfig getConfigForWidth(double width) {
    if (width > 1200) {
      // Desktop - 4 columns
      return const GridConfig(
        crossAxisCount: 4,
        childAspectRatio: 0.75,
        spacing: 20,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      );
    } else if (width > 900) {
      // Large tablet - 3 columns
      return const GridConfig(
        crossAxisCount: 3,
        childAspectRatio: 0.8,
        spacing: 18,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      );
    } else if (width > 600) {
      // Tablet - 2 columns
      return const GridConfig(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        spacing: 16,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      );
    } else {
      // Mobile - 2 columns
      return const GridConfig(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        spacing: 12,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      );
    }
  }
}
