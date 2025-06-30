import 'package:flutter/material.dart';
import 'package:flutter_app_assignment/models/user.dart';
import 'package:flutter_app_assignment/services/service.dart';

class UserProvider  with ChangeNotifier {
  List<User> _users = [];
  List<User> _filteredUsers = [];
  bool _isLoading = false;
  String _searchQuery = '';
  String _error='';

  List<User>get users=>_filteredUsers;
  bool get isLoading => _isLoading;
  String get searchQuery => _searchQuery; 
  String get error => _error;

  Future<void> fetchUsers() async {
    print('UserProvider: Starting to fetch users...');
    _isLoading = true;
    _error = '';
    notifyListeners();
    
    try {
      print('UserProvider: Calling ApiService.fetchUsers()');
      _users = await ApiService.fetchUsers();
      _filteredUsers = List.from(_users);
      _isLoading = false;
      print('UserProvider: Successfully loaded ${_users.length} users');
    } catch (e) {
      print('UserProvider: Error occurred: $e');
      _error = e.toString();
      _isLoading = false;
    }
    notifyListeners();
  }
  void addUser(User user) {
    _users.add(user);
    _filteredUsers.add(user);
    notifyListeners();
  }
void searchUser(String query) {
    _searchQuery = query;
    if (query.isEmpty) {
      _filteredUsers = List.from(_users);
    } else {
      _filteredUsers = _users.where((user) {
        return user.name.toLowerCase().contains(query.toLowerCase()) ||
            user.email.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}