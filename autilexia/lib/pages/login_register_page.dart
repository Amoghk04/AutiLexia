import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spectramind/mongodb_auth.dart';
import 'package:spectramind/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;
  String text = "Don't have an account? Register instead!";

  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  final _auth = MongoDBAuth();

  Future<void> handleAuth() async {
    final username = _controllerUsername.text.trim();
    final password = _controllerPassword.text.trim();

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        errorMessage = 'Username and password cannot be empty';
      });
      return;
    }

    String result;
    if (isLogin) {
      result = await _auth.loginUser(username, password);
    } else {
      result = await _auth.registerUser(username, password);
    }

    setState(() {
      errorMessage = result;
    });
    
    if (result=='Login successful' || result=='Registration successful') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomePage(username: username),
        ),
      );
    }
  }

  Widget _logo() {
    return Image.asset("lib/images/logo.png");
  }

  Widget _welcome() {
    return const Text(
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
          color: Colors.black54,
          fontFamily: 'Hind'),
      'AutiLexia',
    );
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
    bool obscureField,
  ) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: TextField(
          obscureText: obscureField,
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.accents[5]),
            ),
            fillColor: Colors.grey.shade300,
            filled: true,
            hintText: title,
            hintStyle: TextStyle(color: Colors.grey[500]),
          ),
        ));
  }

  Widget _errorMessage() {
    return Text(
        style: TextStyle(
          color: (errorMessage == 'Registration successful' || errorMessage == 'Login successful')
              ? Colors.green
              : Colors.redAccent,
        ),
        errorMessage == '' ? '' : errorMessage!);
  }

  Widget _submitButton() {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.accents[5])),
      onPressed: handleAuth,
      child: Text(isLogin ? 'Login' : 'Register'),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
          text = isLogin
              ? "Don't have an account? Register instead!"
              : "Have an account? Login instead!";
        });
      },
      child: Text(style: TextStyle(color: Colors.accents[5]), text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFF6E40), Color(0xFFE0F7FA)])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 6,
                left: 20,
                right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _welcome(),
                _logo(),
                _entryField('Username', _controllerUsername, false),
                const SizedBox(height: 5),
                _entryField('Password', _controllerPassword, true),
                const SizedBox(height: 5),
                _errorMessage(),
                _submitButton(),
                _loginOrRegisterButton(),
              ],
            ),
          )),
    );
  }
}
