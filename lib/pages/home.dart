import 'package:flutter/material.dart';
import 'package:first_app/product_manager.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function addProduct, deleteProduct;

  const HomePage(this.products, this.addProduct, this.deleteProduct,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                title: const Text("Choose"),
              ),
              ListTile(
                title: const Text("Manage Products"),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/admin');
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("Easy List"),
        ),
        body: ProductManager(
          products: products,
          addProduct: addProduct,
          deleteProduct: deleteProduct,
        ));
  }
}