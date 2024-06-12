import 'package:first_app/pages/product_edit.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function updateProduct;
  const ProductListPage({required this.products, required this.updateProduct, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Image.asset(products[index]['imageUrl']),
          title: Text(products[index]['title']),
          trailing: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) {
                  return ProductEditPage(
                    product: products[index],
                    addProduct: () {},
                    productIndex: index,
                    updateProduct: updateProduct,
                  );
                },
              ));
            },
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
