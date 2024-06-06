import 'package:flutter/material.dart';
import 'package:first_app/pages/admin.dart';
import 'package:first_app/product_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return AdminPage();
                  }));
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("Easy List"),
        ),
        body: const ProductManager());
  }
}
