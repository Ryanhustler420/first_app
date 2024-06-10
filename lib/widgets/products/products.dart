import 'package:first_app/widgets/products/product_card.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>?> products;

  // const Products({this.products = const [], super.key});
  const Products(this.products, {super.key});

  Widget _buildProductList() {
    Widget productCards;
    if (products.isNotEmpty) {
      productCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) => ProductCard(
          products[index]!,
          index,
        ),
        itemCount: products.length,
      );
    } else {
      productCards = Container();
    }
    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
