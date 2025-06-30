import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isLastField;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.validator,
    this.keyboardType,
    this.isLastField = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
      padding: EdgeInsets.all(screenWidth > 600 ? 16 : 12),
      decoration: BoxDecoration(
        border: isLastField
            ? null
            : Border(
                bottom: BorderSide(
                  color: Colors.grey.shade100,
                  width: 1,
                ),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: screenWidth > 600 ? 14 : 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            validator: validator,
            keyboardType: keyboardType,
            style: TextStyle(
              fontSize: screenWidth > 600 ? 16 : 14,
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontSize: screenWidth > 600 ? 16 : 14,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              isDense: true,
            ),
          ),
        ],
      ),
    );
  }
}
