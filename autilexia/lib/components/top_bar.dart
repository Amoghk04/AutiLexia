import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

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

  Future<int> _getUserTokens() async {
    // Set up MongoDB connection
    var db = await Db.create('mongodb://your_mongo_db_url_here');
    await db.open();
    
    var collection = db.collection('users');
    
    // Find the document where 'name' equals the username
    var user = await collection.findOne(where.eq('name', username));
    
    // Close the database connection
    await db.close();
    
    if (user != null) {
      // Assuming the field for tokens is named 'tokens'
      return user['tokens'] ?? 0;
    } else {
      return 0; // Default value if user is not found
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: _getUserTokens(),
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
