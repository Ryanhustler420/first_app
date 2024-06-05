import 'package:flutter/material.dart';

// import './products.dart'; // same
import 'package:first_app/products.dart';
import 'package:first_app/product_control.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;

  const ProductManager({super.key, required this.startingProduct});
  // const ProductManager({super.key, this.startingProduct = 'Sweet Tester'});

  @override
  State<StatefulWidget> createState() {
    return _ProductManager();
  }
}

class _ProductManager extends State<ProductManager> {
  final List<String> _products = [];

  @override
  void initState() {
    _products.add(widget.startingProduct);
    super.initState();
  }

  void _addProduct(String product) {
    setState(() {
      _products.add(product);
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
        Expanded(child: Products(_products))
      ],
    );
  }
}
