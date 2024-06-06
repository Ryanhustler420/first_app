import 'package:flutter/material.dart';

// import './products.dart'; // same
import 'package:first_app/products.dart';
import 'package:first_app/product_control.dart';

class ProductManager extends StatefulWidget {
  final Map<String, String>? startingProduct;

  const ProductManager({super.key, this.startingProduct});
  // const ProductManager({super.key, this.startingProduct = 'Sweet Tester'});

  @override
  State<StatefulWidget> createState() {
    return _ProductManager();
  }
}

class _ProductManager extends State<ProductManager> {
  final List<Map<String, String>?> _products = [];

  @override
  void initState() {
    if (widget.startingProduct != null) {
      _products.add(widget.startingProduct);
    }
    super.initState();
  }

  // void _addProduct(Map<String, dynamic> product) {}
  void _addProduct(Map<String, String> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  void didUpdateWidget(covariant ProductManager oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10.0),
          child: ProductControl(_addProduct),
        ),
        Expanded(child: Products(_products, deleteProduct: _deleteProduct))
      ],
    );
  }
}
