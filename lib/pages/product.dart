import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail"),
      ),
      body: Column(
        children: <Widget>[
          const Text("Details"),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("BACK"),
          ),
        ],
      ),
    );
  }
}
