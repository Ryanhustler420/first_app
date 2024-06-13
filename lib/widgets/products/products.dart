import 'package:first_app/models/product.dart';
import 'package:first_app/widgets/products/product_card.dart';
import 'package:first_app/scoped-models/products.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  Widget _buildProductList(List<Product> products) {
    Widget productCards;
    if (products.isNotEmpty) {
      productCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) => ProductCard(
          products[index],
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
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget? child, ProductsModel model) {
        return _buildProductList(model.displayProducts);
      },
    );
  }
}
