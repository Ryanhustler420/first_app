import 'package:first_app/scoped-models/products.dart';
import 'package:first_app/widgets/products/products.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: const Text("Easy List"),
        actions: <Widget>[
          ScopedModelDescendant(builder:
              (BuildContext context, Widget? widget, ProductsModel model) {
            return IconButton(
                icon: Icon(model.selectedFavorites
                    ? Icons.favorite
                    : Icons.favorite_border),
                color: Colors.red,
                onPressed: () {
                  model.toggleDisplayMode();
                });
          }),
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
        child: Products(),
      ),
    );
  }
}
