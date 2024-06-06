import 'package:flutter/material.dart';
import 'package:first_app/pages/product.dart';

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
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext ctx) {
                        return const ProductPage();
                      },
                    ),
                  );
                },
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
