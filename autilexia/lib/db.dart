import 'dart:convert';
import 'package:http/http.dart' as http;

class DatabaseManager {
  final String apiUrl;

  // Initialize with the Flask API URL
  DatabaseManager({required this.apiUrl});

  // Add a new user to the 'users' collection via Flask API
  Future<void> addCollectionUser({required String? email, required String currentDate}) async {
    var url = Uri.parse('$apiUrl/addUser');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "name": email,
        "tokens": 0,
        "completed_dc": -1,
        "completed": 0,
        "multiplier": 1,
        "last_login": currentDate,
        "last_challenge": ""
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add user');
    }
  }

  // Update the 'completed_dc' field for a specific user
  Future<void> updateUserCompletedDc({required String? email, required int completedDc}) async {
    var url = Uri.parse('$apiUrl/updateCompletedDc');
    var response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "name": email,
        "completed_dc": completedDc,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user completed_dc');
    }
  }

  // Update the 'multiplier' field for a specific user
  Future<void> updateUserMultiplier({required String? email, required int multiplier}) async {
    var url = Uri.parse('$apiUrl/updateMultiplier');
    var response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "name": email,
        "multiplier": multiplier,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user multiplier');
    }
  }

  // Update the 'last_login', 'completed', and 'multiplier' fields for a user
  Future<void> updateUserLastLogin({required String? email, required String lastLogin}) async {
    var url = Uri.parse('$apiUrl/updateLastLogin');
    var response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "name": email,
        "last_login": lastLogin,
        "completed": 0,
        "multiplier": 1,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user last login');
    }
  }

  // Update the 'tokens' field for a specific user
  Future<void> updateUserTokens({required String? email, required int tokens}) async {
    var url = Uri.parse('$apiUrl/updateTokens');
    var response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "name": email,
        "tokens": tokens,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user tokens');
    }
  }

  // Update the 'last_challenge' field for a specific user
  Future<void> updateUserLastDailyChallenge({required String? email, required String? lastDailyChallenge}) async {
    var url = Uri.parse('$apiUrl/updateLastDailyChallenge');
    var response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "name": email,
        "last_challenge": lastDailyChallenge,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user last daily challenge');
    }
  }

  // Update the 'completed' field for a specific user
  Future<void> updateUserModules({required String? email, required int modules}) async {
    var url = Uri.parse('$apiUrl/updateCompletedModules');
    var response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "name": email,
        "completed": modules,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user modules');
    }
  }
}
