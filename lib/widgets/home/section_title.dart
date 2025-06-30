import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: screenWidth > 1200 ? 24 : 
                   screenWidth > 600 ? 22 : 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
