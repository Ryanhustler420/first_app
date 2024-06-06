import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final Map<String, String>? product;

  const ProductPage(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product!['title']!),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(product!['imageUrl']!),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Text(product!['title']!),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              onPressed: () => Navigator.pop(context, true),
              child: const Text("DELETE"),
            ),
          ),
        ],
      ),
    );
  }
}
