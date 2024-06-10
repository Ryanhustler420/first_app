import 'package:flutter/material.dart';
import 'package:first_app/product_manager.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  const HomePage(this.products, {super.key});

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
              leading: const Icon(Icons.edit),
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
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage("assets/background.jpg"),
            //   fit: BoxFit.cover,
            //   colorFilter: ColorFilter.mode(Colors.black26, BlendMode.dstATop),
            // ),
            ),
        child: ProductManager(
          products: products,
        ),
      ),
    );
  }
}
