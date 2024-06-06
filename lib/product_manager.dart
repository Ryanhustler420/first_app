import 'package:flutter/material.dart';

// import './products.dart'; // same
import 'package:first_app/products.dart';
import 'package:first_app/product_control.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, String>?> products;
  final Function addProduct, deleteProduct;

  const ProductManager({required this.products, required this.addProduct, required this.deleteProduct, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10.0),
          child: ProductControl(addProduct),
        ),
        Expanded(child: Products(products, deleteProduct: deleteProduct))
      ],
    );
  }
}
