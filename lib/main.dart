import "package:flutter/material.dart";
import "package:first_app/pages/home.dart";
import "package:first_app/pages/admin.dart";
import "package:first_app/pages/product.dart";

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final List<Map<String, String>> _products = [];

  // void _addProduct(Map<String, dynamic> product) {}
  void _addProduct(Map<String, String> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepOrange,
        primaryColor: Colors.deepPurple,
      ),
      // home: const AuthPage(),
      routes: {
        '/': (BuildContext context) =>
            HomePage(_products, _addProduct, _deleteProduct),
        '/admin': (BuildContext context) => const AdminPage()
      },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == null) return null;

        final List<String> pathElements = settings.name!.split('/');
        if (pathElements[0] != '') return null;
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext ctx) => ProductPage(_products[index]),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                HomePage(_products, _addProduct, _deleteProduct));
      },
    );
  }
}
