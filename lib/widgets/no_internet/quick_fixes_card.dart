import 'package:flutter/material.dart';
import 'tip_data.dart';
import 'tip_item.dart';

class QuickFixesCard extends StatelessWidget {
  final double screenWidth;
  final List<TipData>? customTips;

  const QuickFixesCard({
    Key? key,
    required this.screenWidth,
    this.customTips,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth > 600 ? 20 : 0,
      ),
      padding: EdgeInsets.all(screenWidth > 600 ? 24 : 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Quick Fixes',
            style: TextStyle(
              fontSize: screenWidth > 600 ? 18 : 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          SizedBox(height: screenWidth > 600 ? 16 : 12),
          ..._buildTipItems(),
        ],
      ),
    );
  }

  List<Widget> _buildTipItems() {
    final tips = customTips ?? TipData.getDefaultTips();
    
    return tips
        .map((tip) => TipItem(
              tip: tip,
              screenWidth: screenWidth,
            ))
        .toList();
  }
}
