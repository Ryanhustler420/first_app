import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>?> products;

  // const Products({this.products = const [], super.key});
  const Products(this.products, {super.key});

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: [
          Image.asset(products[index]!['imageUrl']!),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  products[index]!['title']!,
                  style: const TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald'),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6.0, vertical: 2.5),
                  child: Text(
                    "\$${products[index]!['price'].toString()}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(5.0)),
            child: const Text("New York, Time Squre"),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.info),
                onPressed: () =>
                    Navigator.pushNamed<bool>(context, '/product/$index'),
              ),
              IconButton(
                icon: const Icon(Icons.favorite_border),
                color: Colors.red,
                onPressed: () =>
                    Navigator.pushNamed<bool>(context, '/product/$index'),
              ),
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
