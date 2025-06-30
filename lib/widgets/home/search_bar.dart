import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';

class UserSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onChanged;

  const UserSearchBar({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          style: const TextStyle(fontSize: 16),
          decoration: InputDecoration(
            hintText: 'Search users...',
            hintStyle: TextStyle(
              color: Colors.grey[500],
              fontSize: 16,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey[500],
              size: 22,
            ),
            suffixIcon: controller.text.isNotEmpty
                ? IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Colors.grey[500],
                      size: 20,
                    ),
                    onPressed: () {
                      controller.clear();
                      context.read<UserProvider>().searchUser('');
                      onChanged();
                    },
                  )
                : null,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
          onChanged: (value) {
            context.read<UserProvider>().searchUser(value);
            onChanged();
          },
        ),
      ),
    );
  }
}
