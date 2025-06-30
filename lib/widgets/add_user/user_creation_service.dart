import 'package:flutter_app_assignment/models/Geo.dart';
import 'package:flutter_app_assignment/models/adress.dart';
import 'package:flutter_app_assignment/models/company.dart';
import 'package:flutter_app_assignment/models/user.dart';

class UserCreationService {
  static User createUser({
    required List<User> existingUsers,
    required String name,
    required String username,
    required String email,
    required String phone,
    required String website,
    required String street,
    required String suite,
    required String city,
    required String zipcode,
    required String companyName,
    required String companyCatchPhrase,
    required String companyBs,
  }) {
    // Generate a unique ID for the new user
    final newId = existingUsers.isNotEmpty
        ? existingUsers.map((u) => u.id).reduce((a, b) => a > b ? a : b) + 1
        : 1;

    return User(
      id: newId,
      name: name.trim(),
      username: username.trim(),
      email: email.trim(),
      phone: phone.trim(),
      website: website.trim(),
      address: Address(
        street: street.trim(),
        suite: suite.trim(),
        city: city.trim(),
        zipcode: zipcode.trim(),
        geo: Geo(lat: "0.0", lng: "0.0"), // Default coordinates
      ),
      company: Company(
        name: companyName.trim(),
        catchPhrase: companyCatchPhrase.trim(),
        bs: companyBs.trim(),
      ),
    );
  }
}
