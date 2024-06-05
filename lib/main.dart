import "package:flutter/material.dart";

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
        body: Card(
          child: Column(
            children: [
              const Text("Food Paradise"),
              Image.asset("assets/food.jpg"),
            ],
          ),
        ),
      ),
    );
  }
}
