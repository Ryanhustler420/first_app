import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;

  const Products(this.products, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: products
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
          .toList(),
    );
  }
}
