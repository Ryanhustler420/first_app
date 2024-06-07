import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final Map<String, dynamic>? product;

  const ProductPage(this.product, {super.key});

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
      child: Scaffold(
        appBar: AppBar(
          title: Text(product!['title']!),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(product!['imageUrl']!),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Text(product!['title']!),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                onPressed: () => _showWarningDialog(context),
                child: const Text("DELETE"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
