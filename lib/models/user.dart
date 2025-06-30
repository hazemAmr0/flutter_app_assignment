import 'package:flutter_app_assignment/models/adress.dart';
import 'package:flutter_app_assignment/models/company.dart';

class User{
final id;
final String name;
final String email;
final String username;
final Address address;
final String phone;
final String website;
final Company company;

User({
  required this.id,
  required this.name,
  required this.email,
  required this.username,
  required this.address,
  required this.phone,
  required this.website,
  required this.company,
});
factory User.fromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    username: json['username'],
    address: Address.fromJson(json['address']),
    phone: json['phone'],
    website: json['website'],
    company: Company.fromJson(json['company']),
  );
}
Map<String, dynamic> toJson() {
  return {
    'id': id,
    'name': name,
    'email': email,
    'username': username,
    'address': address.toJson(),
    'phone': phone,
    'website': website,
    'company': company.toJson(),
  };
}
}

