import 'package:flutter/material.dart';
import '../user_card.dart';

class AnimatedUserCard extends StatefulWidget {
  final dynamic user;
  final int index;
  final VoidCallback onTap;

  const AnimatedUserCard({
    Key? key,
    required this.user,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  @override
  State<AnimatedUserCard> createState() => _AnimatedUserCardState();
}

class _AnimatedUserCardState extends State<AnimatedUserCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
  }

  void _initializeAnimation() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 200 + (widget.index * 50)),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    ));

    // Staggered animation
    Future.delayed(Duration(milliseconds: widget.index * 100), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: UserCard(
            user: widget.user,
            onTap: widget.onTap,
          ),
        );
      },
    );
  }
}
