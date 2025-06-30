import 'package:flutter/material.dart';
import '../../screens/add_user_screen.dart';

class AddUserButton extends StatelessWidget {
  final FocusNode searchFocusNode;

  const AddUserButton({
    Key? key,
    required this.searchFocusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: IconButton(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 20,
          ),
        ),
        onPressed: () => _navigateToAddUser(context),
      ),
    );
  }

  void _navigateToAddUser(BuildContext context) {
    searchFocusNode.unfocus();
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const AddUserScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            )),
            child: child,
          );
        },
      ),
    );
  }
}
