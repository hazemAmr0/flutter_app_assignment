import 'package:flutter/material.dart';

class NoInternetTitleSection extends StatelessWidget {
  final double screenWidth;

  const NoInternetTitleSection({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Oops! No Internet',
          style: TextStyle(
            fontSize: _getTitleFontSize(),
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth > 600 ? 40 : 0,
          ),
          child: Text(
            'It seems like you are not connected to the internet. Please check your connection and try again.',
            style: TextStyle(
              fontSize: screenWidth > 600 ? 16 : 14,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  double _getTitleFontSize() {
    if (screenWidth > 1200) return 32;
    if (screenWidth > 600) return 28;
    return 24;
  }
}
