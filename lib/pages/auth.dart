import 'package:flutter/material.dart';
import 'package:first_app/pages/home.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Login"),
          onPressed: () {
            // is already authenticated
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const HomePage()));
          },
        ),
      ),
    );
  }
}
