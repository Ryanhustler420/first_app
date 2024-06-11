import 'package:first_app/pages/product_create.dart';
import 'package:first_app/pages/product_list.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  final Function addProduct, deleteProduct;
  const AdminPage(
      {required this.addProduct, required this.deleteProduct, super.key});

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: const Text("Choose"),
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text("All Products"),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/home");
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          title: const Text("Manage Products"),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: 'Create Product',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'My Products',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductCreatePage(addProduct, deleteProduct),
            const ProductListPage(),
          ],
        ),
      ),
    );
  }
}
