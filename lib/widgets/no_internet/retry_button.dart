import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/connectivity_provider.dart';
import 'retry_button_content.dart';

class RetryButton extends StatelessWidget {
  final double screenWidth;
  final VoidCallback? onRetry;

  const RetryButton({
    Key? key,
    required this.screenWidth,
    this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectivityProvider>(
      builder: (context, connectivityProvider, child) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: connectivityProvider.isCheckingConnection
                ? null
                : () {
                    if (onRetry != null) {
                      onRetry!();
                    } else {
                      connectivityProvider.retryConnection();
                    }
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade600,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                vertical: screenWidth > 600 ? 18 : 16,
              ),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: connectivityProvider.isCheckingConnection
                ? LoadingButtonContent(screenWidth: screenWidth)
                : RetryButtonContent(screenWidth: screenWidth),
          ),
        );
      },
    );
  }
}
