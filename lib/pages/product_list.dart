import 'package:first_app/pages/product_edit.dart';
import 'package:first_app/scoped-models/products.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  Widget _buildEditButton(
      BuildContext context, int index, ProductsModel model) {
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () {
        model.selectProduct(index);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) {
            return const ProductEditPage();
          },
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget? widget, ProductsModel model) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            background: Container(color: Colors.red),
            onDismissed: (DismissDirection direction) {
              if (direction == DismissDirection.endToStart) {
                model.selectProduct(index);
                model.deleteProduct(index);
              } else if (direction == DismissDirection.startToEnd) {
                print("Swiped start to end direction");
              } else {
                print("Other swiping direction");
              }
            },
            key: Key(model.products[index].title),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(model.products[index].imageUrl),
                  ),
                  title: Text(model.products[index].title),
                  subtitle: Text(
                    "\$${model.products[index].price.toString()}",
                  ),
                  trailing: _buildEditButton(context, index, model),
                ),
                const Divider()
              ],
            ),
          );
        },
        itemCount: model.products.length,
      );
    });
  }
}
