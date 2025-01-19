import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/register_page.dart'; // Import the RegisterPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Food App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(
        onLoginClick: () {
          // Define your onLoginClick behavior here
          print("Login clicked");
        },
      ),
    );
  }
}
