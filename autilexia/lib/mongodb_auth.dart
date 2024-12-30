import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MongoDBAuth {
  final String baseUrl = 'http://127.0.0.1:5000';
  static String? username;

  final BehaviorSubject<String?> _authStateController = BehaviorSubject<String?>.seeded(null);

  Stream<String?> get authStateChanges => _authStateController.stream;

  // Notify auth state changes
  Future<void> _notifyAuthStateChange() async {
    debugPrint('Auth state changed: $username');
    _authStateController.add(null); // Emit a null state first
    _authStateController.add(username); // Emit the actual username
  }

  // Save username to persistent storage
  Future<void> _saveUsername(String? username) async {
    final prefs = await SharedPreferences.getInstance();
    if (username != null) {
      await prefs.setString('username', username);
    } else {
      await prefs.remove('username');
    }
  }

  // Load username from persistent storage
  Future<void> _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username');
    _notifyAuthStateChange();
  }

  // Call this during app startup
  Future<void> initializeAuthState() async {
    await _loadUsername(); // Load username and notify state
  }

  // Register user
  Future<String> registerUser(String username, String password) async {
    final url = Uri.parse('$baseUrl/register');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'username': username, 'password': password}),
      );

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        return responseBody['message'] ?? 'Registration successful';
      } else {
        final responseBody = json.decode(response.body);
        return responseBody['error'] ?? 'Failed to register user';
      }
    } catch (e) {
      return 'An error occurred: $e';
    }
  }

  // Login user
  Future<String> loginUser(String username, String password) async {
    final url = Uri.parse('$baseUrl/login');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'username': username, 'password': password}),
      );

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        MongoDBAuth.username = username;
        debugPrint('User logged in: $username');
        await _saveUsername(username); // Save username persistently
        _notifyAuthStateChange(); // Notify state change
        return responseBody['message'] ?? 'Login successful';
      } else {
        final responseBody = json.decode(response.body);
        return responseBody['error'] ?? 'Failed to log in user';
      }
    } catch (e) {
      return 'An error occurred: $e';
    }
  }

  // Log out user
  Future<void> signOut() async {
    MongoDBAuth.username = null;
    await _saveUsername(null); // Clear persisted username
    _notifyAuthStateChange();
  }

  void dispose() {
    _authStateController.close();
  }

  // Fetch question data
  Future<Map<String, dynamic>?> getQuestionData(int questionIndex) async {
    final url = Uri.parse('$baseUrl/question/$questionIndex');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
    } catch (e) {
      debugPrint('Error fetching question data: $e');
    }
    return null;
  }

  // Fetch user data
  Future<Map<String, dynamic>?> getUserData(String username) async {
    final url = Uri.parse('$baseUrl/user?name=$username');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
    } catch (e) {
      debugPrint('Error fetching user data: $e');
    }
    return null;
  }

  // Update user tokens
  Future<bool> updateUserTokens(String username, int tokens) async {
    final url = Uri.parse('$baseUrl/user/updateTokens');
    try {
      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'username': username, 'tokens': tokens}),
      );
      return response.statusCode == 200;
    } catch (e) {
      debugPrint('Error updating user tokens: $e');
      return false;
    }
  }

  // Update user modules
  Future<bool> updateUserModules(String username, List<String> modules) async {
    final url = Uri.parse('$baseUrl/user/update_modules');
    try {
      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'username': username, 'modules': modules}),
      );
      return response.statusCode == 200;
    } catch (e) {
      debugPrint('Error updating user modules: $e');
      return false;
    }
  }

  // Update user multiplier
  Future<bool> updateUserMultiplier(String username, int multiplier) async {
    final url = Uri.parse('$baseUrl/user/update_multiplier');
    try {
      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'username': username, 'multiplier': multiplier}),
      );
      return response.statusCode == 200;
    } catch (e) {
      debugPrint('Error updating user multiplier: $e');
      return false;
    }
  }
}
