import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TopBar extends StatelessWidget {
  final String imagePath;
  final String username;  // Accept 'username' as a String

  const TopBar({super.key, required this.imagePath, required this.username});

  Widget _text(int tokens) {
    return Text(
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.grey.shade800,
        fontSize: 15.0,
      ),
      "$tokens",
    );
  }

  Future<int> _getUserTokens(String username) async {
  final url = Uri.parse('http://127.0.0.1:5000/getTokens?username=$username'); // Replace with your actual Flask API URL
  
  try {
    final response = await http.get(url);
    
    if (response.statusCode == 200) {
      // Parse the JSON response
      final data = json.decode(response.body);
      return data['tokens'] ?? 0; // Assuming the response contains a field named 'tokens'
    } else {
      // Handle non-200 responses
      print('Failed to load tokens: ${response.statusCode}');
      return 0; // Default value if the request fails
    }
  } catch (e) {
    print('Error fetching user tokens: $e');
    return 0; // Return default value on error
  }
}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: _getUserTokens(username),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const Text(
                textScaleFactor: 0.7,
                style: TextStyle(color: Colors.black),
                "Tokens",
              ),
              Image.asset(
                imagePath,
                scale: 9.0,
                alignment: Alignment.bottomCenter,
              ),
              const Text(
                textScaleFactor: 0.7,
                style: TextStyle(color: Colors.black),
                ": ",
              ),
              const CircularProgressIndicator(),
            ],
          );
        } else if (snapshot.hasError) {
          return const Text("Error loading tokens");
        } else if (snapshot.hasData) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const Text(
                textScaleFactor: 0.7,
                style: TextStyle(color: Colors.black),
                "Tokens",
              ),
              Image.asset(
                imagePath,
                scale: 9.0,
                alignment: Alignment.bottomCenter,
              ),
              const Text(
                textScaleFactor: 0.7,
                style: TextStyle(color: Colors.black),
                ": ",
              ),
              _text(snapshot.data!),
            ],
          );
        } else {
          return const Text("No tokens available");
        }
      },
    );
  }
}
