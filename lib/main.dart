import "package:first_app/pages/admin.dart";
import "package:first_app/pages/home.dart";
import "package:flutter/material.dart";
import "package:first_app/pages/auth.dart";

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepOrange,
        primaryColor: Colors.deepPurple,
      ),
      // home: const AuthPage(),
      routes: {
        '/': (BuildContext context) => const AuthPage(),
        '/admin': (BuildContext context) => const AdminPage()
      },
    );
  }
}
