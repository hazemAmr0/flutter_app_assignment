import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';
import '../../screens/user_details_screen.dart';
import 'animated_user_card.dart';
import 'error_state.dart';
import 'empty_state.dart';
import 'loading_state.dart';
import 'grid_config.dart';

class UsersGrid extends StatelessWidget {
  final AnimationController animationController;
  final FocusNode searchFocusNode;
  final bool hasSearchQuery;

  const UsersGrid({
    Key? key,
    required this.animationController,
    required this.searchFocusNode,
    required this.hasSearchQuery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        if (userProvider.isLoading) {
          return const LoadingState();
        }

        if (userProvider.error.isNotEmpty) {
          return ErrorState(userProvider: userProvider);
        }

        if (userProvider.users.isEmpty) {
          return EmptyState(hasSearchQuery: hasSearchQuery);
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            final config = GridConfig.getConfigForWidth(constraints.maxWidth);

            return AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, 20 * (1 - animationController.value)),
                  child: Opacity(
                    opacity: animationController.value,
                    child: GridView.builder(
                      padding: config.padding,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: config.crossAxisCount,
                        childAspectRatio: config.childAspectRatio,
                        crossAxisSpacing: config.spacing,
                        mainAxisSpacing: config.spacing,
                      ),
                      itemCount: userProvider.users.length,
                      itemBuilder: (context, index) {
                        final user = userProvider.users[index];
                        return AnimatedUserCard(
                          user: user,
                          index: index,
                          onTap: () => _navigateToUserDetails(context, user),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  void _navigateToUserDetails(BuildContext context, dynamic user) {
    searchFocusNode.unfocus();
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => 
            UserDetailScreen(user: user),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
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
