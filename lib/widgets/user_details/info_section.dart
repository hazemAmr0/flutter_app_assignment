import 'package:flutter/material.dart';
import 'section_title.dart';
import 'info_item.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final List<InfoItem> items;

  const InfoSection({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: title),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            children: items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return InfoItem(
                label: item.label,
                value: item.value,
                icon: item.icon,
                isLast: index == items.length - 1,
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
