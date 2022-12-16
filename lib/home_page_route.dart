import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:safeboda/login_view.dart';
import 'package:safeboda/main_ui.dart';
import 'package:safeboda/register_view.dart';
import 'firebase_options.dart';

class HomePageRoute extends StatelessWidget {
  const HomePageRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if (user?.emailVerified ?? false) {
                print(user);
                return const MainUi();
              } else {
                print(user);
                return const RegisterPage();
              }
            default:
              const CircularProgressIndicator();
          }
          return const Text("Done");
        });
  }
}
