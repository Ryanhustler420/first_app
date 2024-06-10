import 'package:first_app/widgets/products/price_tag.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final int productIndex;
  final Map<String, dynamic> product;

  const ProductCard(this.product, this.productIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(product['imageUrl']!),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  product['title']!,
                  style: const TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald'),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                PriceTag(product['price'].toString()),
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
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/product/$productIndex'),
              ),
              IconButton(
                icon: const Icon(Icons.favorite_border),
                color: Colors.red,
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/product/$productIndex'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
