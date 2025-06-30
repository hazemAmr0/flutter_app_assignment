import 'dart:convert';
import 'package:flutter_app_assignment/models/user.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<User>> fetchUsers() async {
    try {
      print('Fetching users from: $baseUrl/users');
      final response = await http.get(
        Uri.parse('$baseUrl/users'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      
      print('Response status code: ${response.statusCode}');
      
      if (response.statusCode == 200) {
        print('Response body length: ${response.body.length}');
        final List<dynamic> jsonData = json.decode(response.body);
        print('JSON data length: ${jsonData.length}');
        
        final users = jsonData.map((json) => User.fromJson(json)).toList();
        print('Successfully parsed ${users.length} users');
        return users;
      } else {
        print('HTTP Error: ${response.statusCode} - ${response.body}');
        throw Exception('Failed to load users: HTTP ${response.statusCode}');
      }
    } catch (e) {
      print('Error in fetchUsers: $e');
      throw Exception('Failed to load users: $e');
    }
  }
}