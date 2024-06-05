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
        body: Column(children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add Product'),
            ),
          ),
          Card(
            child: Column(
              children: [
                Image.asset("assets/food.jpg"),
                const Text("Food Paradise"),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
