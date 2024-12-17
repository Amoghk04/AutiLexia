import 'package:flutter/material.dart';
import 'package:spectramind/pages/login_register_page.dart'; // Replace with the actual path to mongodb_auth.dart
import 'package:spectramind/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(), // Use AuthScreen directly
    );
  }
}
