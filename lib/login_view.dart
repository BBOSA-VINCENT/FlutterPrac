import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safeboda/main_ui.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          title: const Text('Login'),
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
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _email.text, password: _password.text);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      "/mainUi",
                      (route) => false,
                    );
                  } on FirebaseAuthException catch (e) {
                    log(e.code.toString());
                  }
                },
                child: const Text("Login"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/register');
                  },
                  child: const Text("Not Registered? Register Here")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/verify', (route) => false);
                  },
                  child: const Text("verify"))
            ],
          ),
        ));
  }
}
