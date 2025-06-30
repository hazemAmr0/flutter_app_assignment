import 'package:flutter/material.dart';
import 'user_avatar.dart';
import '../../models/user.dart';

class UserHeaderCard extends StatelessWidget {
  final User user;

  const UserHeaderCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final avatarSize = screenWidth > 600 ? 120.0 : 100.0;
    
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.all(screenWidth > 600 ? 32 : 24),
      child: Column(
        children: [
          UserAvatar(
            name: user.name,
            size: avatarSize,
          ),
          SizedBox(height: screenWidth > 600 ? 20 : 16),
          Text(
            user.name,
            style: TextStyle(
              fontSize: screenWidth > 1200 ? 28 : screenWidth > 600 ? 24 : 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '@${user.username}',
            style: TextStyle(
              fontSize: screenWidth > 600 ? 16 : 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
