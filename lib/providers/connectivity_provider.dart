import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class ConnectivityProvider with ChangeNotifier {
  bool _isConnected = true;
  bool _isCheckingConnection = false;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  bool get isConnected => _isConnected;
  bool get isCheckingConnection => _isCheckingConnection;

  ConnectivityProvider() {
    _initConnectivity();
  }

  void _initConnectivity() {
    // Listen for connectivity changes
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> results) {
        _checkInternetConnection();
      },
    );
    
    // Check initial connectivity
    _checkInternetConnection();
  }

  Future<void> _checkInternetConnection() async {
    _isCheckingConnection = true;
    notifyListeners();

    try {
      // First check connectivity status
      final connectivityResults = await Connectivity().checkConnectivity();
      
      if (connectivityResults.contains(ConnectivityResult.none)) {
        _isConnected = false;
      } else {
        // Even if we have connectivity, we need to check if we can actually reach the internet
        _isConnected = await _hasInternetAccess();
      }
    } catch (e) {
      _isConnected = false;
    } finally {
      _isCheckingConnection = false;
      notifyListeners();
    }
  }

  Future<bool> _hasInternetAccess() async {
    try {
      // Try to make a simple HTTP request to check real internet connectivity
      final response = await http.get(
        Uri.parse('https://www.google.com'),
      ).timeout(const Duration(seconds: 5));
      
      return response.statusCode == 200;
    } catch (e) {
      // If we can't reach Google, try a few other reliable sources
      try {
        final response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
        ).timeout(const Duration(seconds: 5));
        
        return response.statusCode == 200;
      } catch (e) {
        return false;
      }
    }
  }

  Future<void> retryConnection() async {
    await _checkInternetConnection();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
}
