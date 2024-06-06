import 'package:flutter/material.dart';
import 'package:first_app/pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>?> products;
  final Function? deleteProduct;

  // const Products({this.products = const [], super.key});
  const Products(this.products, {this.deleteProduct, super.key});

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: [
          Image.asset(products[index]!['imageUrl']!),
          Text(products[index]!['title']!),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed<bool>(context, '/product/$index')
                        .then((bool? value) {
                  if (value == true && deleteProduct != null) {
                    deleteProduct!(index);
                  }
                }),
                child: const Text("Details"),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCards;
    if (products.isNotEmpty) {
      productCards = ListView.builder(
        itemBuilder: _buildProductItem,
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
