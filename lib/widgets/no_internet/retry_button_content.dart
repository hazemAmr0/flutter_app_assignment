import 'package:flutter/material.dart';

class RetryButtonContent extends StatelessWidget {
  final double screenWidth;

  const RetryButtonContent({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.refresh_rounded,
          size: screenWidth > 600 ? 24 : 20,
        ),
        const SizedBox(width: 8),
        Text(
          'Try Again',
          style: TextStyle(
            fontSize: screenWidth > 600 ? 16 : 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class LoadingButtonContent extends StatelessWidget {
  final double screenWidth;

  const LoadingButtonContent({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          'Checking...',
          style: TextStyle(
            fontSize: screenWidth > 600 ? 16 : 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
