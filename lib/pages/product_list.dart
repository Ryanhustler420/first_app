import 'package:first_app/pages/product_edit.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function updateProduct, deleteProduct;
  const ProductListPage(
      {required this.products,
      required this.deleteProduct,
      required this.updateProduct,
      super.key});

  Widget _buildEditButton(BuildContext context, int index) {
    return IconButton(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          background: Container(color: Colors.red),
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) {
              deleteProduct(index);
            } else if (direction == DismissDirection.startToEnd) {
              print("Swiped start to end direction");
            } else {
              print("Other swiping direction");
            }
          },
          key: Key(products[index]['title']),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(products[index]['imageUrl']),
                ),
                title: Text(products[index]['title']),
                subtitle: Text(
                  "\$${products[index]['price'].toString()}",
                ),
                trailing: _buildEditButton(context, index),
              ),
              const Divider()
            ],
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
