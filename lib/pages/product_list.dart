import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  const ProductListPage({required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Image.asset(products[index]['imageUrl']),
          title: Text(products[index]['title']),
          trailing: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
