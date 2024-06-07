import 'package:flutter/material.dart';

// import './products.dart'; // same
import 'package:first_app/products.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, dynamic>?> products;

  const ProductManager({required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Products(products))
      ],
    );
  }
}
