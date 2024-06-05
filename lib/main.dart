import "package:flutter/material.dart";

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final List<String> _products = ['Food Tester'];

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
              onPressed: () {
                setState(() {
                  _products.add("Advance Food Tester");
                });
              },
              child: const Text('Add Product'),
            ),
          ),
          Column(
              children: _products
                  .map(
                    (toElement) => Card(
                      child: Column(
                        children: [
                          Image.asset("assets/food.jpg"),
                          const Text("Food Paradise"),
                        ],
                      ),
                    ),
                  )
                  .toList())
        ]),
      ),
    );
  }
}
