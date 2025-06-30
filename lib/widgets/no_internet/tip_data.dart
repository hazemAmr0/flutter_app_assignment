import 'package:flutter/material.dart';

class TipData {
  final IconData icon;
  final String text;
  final Color color;

  const TipData({
    required this.icon,
    required this.text,
    required this.color,
  });

  // Static method to get default tips
  static List<TipData> getDefaultTips() {
    return [
      TipData(
        icon: Icons.wifi_rounded,
        text: 'Check your WiFi connection',
        color: Colors.blue.shade400,
      ),
      TipData(
        icon: Icons.signal_cellular_alt_rounded,
        text: 'Try mobile data if available',
        color: Colors.green.shade400,
      ),
      TipData(
        icon: Icons.router_rounded,
        text: 'Restart your router',
        color: Colors.orange.shade400,
      ),
    ];
  }
}
