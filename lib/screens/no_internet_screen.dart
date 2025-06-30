import 'package:flutter/material.dart';
import '../widgets/no_internet/animated_wifi_icon.dart';
import '../widgets/no_internet/title_section.dart';
import '../widgets/no_internet/quick_fixes_card.dart';
import '../widgets/no_internet/retry_button.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _slideController;
  late Animation<double> _pulseAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _pulseAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutBack,
    ));

    _pulseController.repeat(reverse: true);
    _slideController.forward();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: _buildGradientBackground(),
        child: SafeArea(
          child: SlideTransition(
            position: _slideAnimation,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: size.width > 600 ? 40 : 24,
                vertical: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.1),
                  AnimatedWifiIcon(
                    pulseAnimation: _pulseAnimation,
                    screenWidth: size.width,
                  ),
                  SizedBox(height: size.height * 0.05),
                  NoInternetTitleSection(screenWidth: size.width),
                  SizedBox(height: size.height * 0.08),
                  QuickFixesCard(screenWidth: size.width),
                  SizedBox(height: size.height * 0.06),
                  RetryButton(screenWidth: size.width),
                  SizedBox(height: size.height * 0.1),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildGradientBackground() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.blue.shade50,
          Colors.purple.shade50,
          Colors.pink.shade50,
        ],
      ),
    );
  }
}
