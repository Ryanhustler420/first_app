import 'package:first_app/pages/product_create.dart';
import 'package:first_app/pages/product_list.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: const Text("Choose"),
              ),
              ListTile(
                title: const Text("All Products"),
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/");
                },
              )
            ],
          ),
        ),
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
        body: const TabBarView(
          children: <Widget>[
            ProductCreatePage(),
            ProductListPage(),
          ],
        ),
      ),
    );
  }
}