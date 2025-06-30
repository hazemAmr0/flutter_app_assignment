import 'package:flutter/material.dart';
import 'add_user_button.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final FocusNode searchFocusNode;

  const HomeAppBar({
    Key? key,
    required this.searchFocusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return AppBar(
      title: Text(
        'Home',
        style: TextStyle(
          fontSize: screenWidth > 1200 ? 32 : 
                   screenWidth > 600 ? 28 : 24,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          letterSpacing: 0.5,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.5,
      centerTitle: false,
      actions: [
        AddUserButton(searchFocusNode: searchFocusNode),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
