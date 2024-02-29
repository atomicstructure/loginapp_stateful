import 'package:flutter/material.dart';
import 'package:loginapp_stateful/src/screens.dart/login_screen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        centerTitle: true,
        title: const Text(
          'Login Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const LoginScreen(),
    );
  }
}
