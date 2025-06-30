import 'package:flutter/material.dart';

class UserDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UserDetailsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return AppBar(
      title: Text(
        'User Details',
        style: TextStyle(
          fontSize: screenWidth > 1200 ? 24 : screenWidth > 600 ? 22 : 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.5,
      iconTheme: const IconThemeData(color: Colors.black87),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
