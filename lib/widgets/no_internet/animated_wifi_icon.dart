import 'package:flutter/material.dart';

class AnimatedWifiIcon extends StatelessWidget {
  final Animation<double> pulseAnimation;
  final double screenWidth;

  const AnimatedWifiIcon({
    Key? key,
    required this.pulseAnimation,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pulseAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: pulseAnimation.value,
          child: Container(
            width: screenWidth > 600 ? 160 : 120,
            height: screenWidth > 600 ? 160 : 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.red.shade400,
                  Colors.orange.shade400,
                  Colors.pink.shade400,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.red.shade200.withOpacity(0.4),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Icon(
              Icons.wifi_off_rounded,
              size: screenWidth > 600 ? 80 : 60,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
