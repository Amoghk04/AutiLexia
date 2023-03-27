import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:neucare/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;
  String text = "Don't have an account? Register instead!";

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _logo() {
    return Image.asset("lib/images/logo.png");
  }

  Widget _welcome() {
    return const Text(
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.black54),
        'Neucare');
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
        style: const TextStyle(color: Colors.redAccent),
        errorMessage == '' ? '' : 'Error! $errorMessage. Please enter again.');
  }

  Widget _submitButton() {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.accents[5])),
      onPressed:
          isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? 'Login' : 'Register'),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
          if (isLogin) {
            text = "Don't have an account? Register instead!";
          } else {
            text = "Have an account? Login instead!";
          }
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
                _entryField('Email', _controllerEmail, false),
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
