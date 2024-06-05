import "package:flutter/material.dart";
import "package:first_app/product_manager.dart";

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Easy List"),
          ),
          body: const ProductManager('Food Tester')),
    );
  }
}
