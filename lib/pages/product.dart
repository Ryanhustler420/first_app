import 'package:first_app/widgets/ui_elements/title_default.dart';
import 'package:first_app/scoped-models/products.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:first_app/models/product.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final int productIndex;

  const ProductPage(this.productIndex, {super.key});

  void _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Are you sure?"),
            content: const Text("This action cannot be undone!"),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // close the dialog
                },
                child: const Text("DISCARD"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // close the dialog
                  Navigator.maybePop(context, true);
                },
                child: const Text("CONTINUE"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        Navigator.maybePop(context, false);
      },
      child: ScopedModelDescendant(
        builder: (BuildContext context, Widget? widget, ProductsModel model) {
          final Product product = model.products[productIndex];
          return Scaffold(
            appBar: AppBar(
              title: Text(product.title),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(product.imageUrl),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: TitleDefault(product.title),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                    ),
                    onPressed: () => _showWarningDialog(context),
                    child: const Text("DELETE"),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
