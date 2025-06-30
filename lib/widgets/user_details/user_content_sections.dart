import 'package:flutter/material.dart';
import 'info_section.dart';
import 'info_item.dart';
import '../../models/user.dart';

class UserContentSections extends StatelessWidget {
  final User user;

  const UserContentSections({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Padding(
      padding: EdgeInsets.all(screenWidth > 600 ? 24 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Personal Info Section
          InfoSection(
            title: 'Personal Info',
            items: [
              InfoItem(label: 'Full Name', value: user.name),
              InfoItem(label: 'Username', value: '@${user.username}'),
            ],
          ),

          // Contact Information Section
          InfoSection(
            title: 'Contact Information',
            items: [
              InfoItem(
                label: 'Email Address',
                value: user.email,
                icon: Icons.email_outlined,
              ),
              InfoItem(
                label: 'Phone Number',
                value: user.phone,
                icon: Icons.phone_outlined,
              ),
              InfoItem(
                label: 'Website',
                value: user.website,
                icon: Icons.language_outlined,
              ),
            ],
          ),

          // Address Section
          InfoSection(
            title: 'Address',
            items: [
              InfoItem(label: 'Street', value: user.address.street),
              InfoItem(label: 'Suite', value: user.address.suite),
              InfoItem(label: 'City', value: user.address.city),
              InfoItem(label: 'Zipcode', value: user.address.zipcode),
              InfoItem(
                label: 'Geo Location',
                value: '${user.address.geo.lat}° N, ${user.address.geo.lng}° W',
                icon: Icons.location_on_outlined,
              ),
            ],
          ),

          // Company Info Section
          InfoSection(
            title: 'Company Info',
            items: [
              InfoItem(label: 'Company Name', value: user.company.name),
              InfoItem(label: 'Catch Phrase', value: user.company.catchPhrase),
              InfoItem(label: 'Business Summary', value: user.company.bs),
            ],
          ),
        ],
      ),
    );
  }
}
