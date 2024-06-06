import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addProduct;

  const ProductControl(this.addProduct, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        addProduct({'title': 'Chocolate', 'imageUrl': 'assets/food.jpg'});
      },
      child: const Text('Add Product'),
    );
  }
}
