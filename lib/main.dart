import 'package:flutter/material.dart';
import 'package:safeboda/home_page_route.dart';
import 'package:safeboda/login_view.dart';
import 'package:safeboda/main_ui.dart';
import 'package:safeboda/prac.dart';
import 'package:safeboda/register_view.dart';
import 'package:safeboda/verify_email_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // runApp(const HelloRectangle());
  runApp(MaterialApp(routes: {
    '/login': (context) => const LoginPage(),
    '/register': (context) => const RegisterPage(),
    '/verify': (context) => const VerifyEmail(),
    '/mainUi': (context) => const MainUi(),
  }, home: const HomePageRoute()));
}
