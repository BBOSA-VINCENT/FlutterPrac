import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _email;
  late TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(hintText: "Enter your Email"),
              keyboardType: TextInputType.emailAddress,
              controller: _email,
            ),
            TextFormField(
              decoration:
                  const InputDecoration(hintText: "Enter your Password"),
              obscureText: true,
              // autocorrect: false,
              // enableSuggestions: false,
              controller: _password,
            ),
            TextButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _email.text, password: _password.text);
                } on FirebaseAuthException catch (e) {
                  log(e.code);
                }
              },
              child: const Text("Register"),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/login', (route) => false);
                },
                child: const Text("Registered? Login Here")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/verify');
                },
                child: const Text("verify"))
          ],
        ),
      ),
    );
  }
}
