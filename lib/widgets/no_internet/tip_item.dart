import 'package:flutter/material.dart';
import 'tip_data.dart';

class TipItem extends StatelessWidget {
  final TipData tip;
  final double screenWidth;

  const TipItem({
    Key? key,
    required this.tip,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenWidth > 600 ? 12 : 8),
      child: Row(
        children: [
          Container(
            width: screenWidth > 600 ? 36 : 32,
            height: screenWidth > 600 ? 36 : 32,
            decoration: BoxDecoration(
              color: tip.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              tip.icon,
              size: screenWidth > 600 ? 20 : 18,
              color: tip.color,
            ),
          ),
          SizedBox(width: screenWidth > 600 ? 12 : 10),
          Expanded(
            child: Text(
              tip.text,
              style: TextStyle(
                fontSize: screenWidth > 600 ? 14 : 12,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
