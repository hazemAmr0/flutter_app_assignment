import 'package:flutter/material.dart';
import '../models/user.dart';
import '../widgets/user_details/index.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  const UserDetailScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: const UserDetailsAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserHeaderCard(user: user),
            UserContentSections(user: user),
          ],
        ),
      ),
    );
  }
}
