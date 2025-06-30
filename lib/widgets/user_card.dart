import 'package:flutter/material.dart';
import '../models/user.dart';

class UserCard extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  const UserCard({Key? key, required this.user, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Responsive sizing based on screen width
    double avatarSize = screenWidth > 1200 ? 80 : screenWidth > 600 ? 70 : 60;
    double titleFontSize = screenWidth > 1200 ? 18 : screenWidth > 600 ? 16 : 14;
    double emailFontSize = screenWidth > 1200 ? 14 : screenWidth > 600 ? 13 : 11;
    double companyFontSize = screenWidth > 1200 ? 12 : screenWidth > 600 ? 11 : 10;
    double cardPadding = screenWidth > 1200 ? 16 : screenWidth > 600 ? 14 : 12;
    
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200, width: 1),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: EdgeInsets.all(cardPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // User Avatar with gradient background
              Container(
                width: avatarSize,
                height: avatarSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: _getGradientColors(user.name),
                  ),
                ),
                child: Center(
                  child: Text(
                    user.name.isNotEmpty ? user.name[0].toUpperCase() : '?',
                    style: TextStyle(
                      fontSize: avatarSize * 0.4,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: cardPadding * 0.7),
              
              // User Name
              Flexible(
                child: Text(
                  user.name,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: cardPadding * 0.25),
              
              // User Email
              Flexible(
                child: Text(
                  user.email,
                  style: TextStyle(
                    fontSize: emailFontSize,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: cardPadding * 0.5),
              
              // Company Name
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: cardPadding * 0.5, vertical: cardPadding * 0.25),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  user.company.name,
                  style: TextStyle(
                    fontSize: companyFontSize,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Color> _getGradientColors(String name) {
    // Generate consistent gradient colors based on name
    final hash = name.hashCode;
    final gradients = [
      [const Color(0xFFE8B794), const Color(0xFFD4A574)], // Warm beige
      [const Color(0xFFFFB6A3), const Color(0xFFE8998D)], // Coral
      [const Color(0xFFA8D8B9), const Color(0xFF7FB069)], // Green
      [const Color(0xFFB8A9C9), const Color(0xFF957DAD)], // Purple
      [const Color(0xFFFFD93D), const Color(0xFFFFB830)], // Yellow
      [const Color(0xFF87CEEB), const Color(0xFF4682B4)], // Blue
      [const Color(0xFFFFB3BA), const Color(0xFFFFAEBC)], // Pink
      [const Color(0xFFFFDFBA), const Color(0xFFFFCCBC)], // Orange
    ];
    
    return gradients[hash.abs() % gradients.length];
  }
}
