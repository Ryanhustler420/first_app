import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;

  // const Products({this.products = const [], super.key});
  const Products(this.products, {super.key});

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: [
          Image.asset("assets/food.jpg"),
          Text(products[index]),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return products.isNotEmpty
        ? ListView.builder(
            itemBuilder: _buildProductItem,
            itemCount: products.length,
          )
        : const Center(
            child: Text("No Product Found, Please Add Some"),
          );
  }
}
