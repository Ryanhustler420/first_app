import "package:first_app/pages/auth.dart";
import "package:first_app/scoped-models/products.dart";
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:scoped_model/scoped_model.dart";
import "package:first_app/pages/home.dart";
import "package:first_app/pages/admin.dart";
import "package:first_app/pages/product.dart";

void main(List<String> args) {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // learn ui from youtube to practice the ui

  @override
  Widget build(BuildContext context) {
    return ScopedModel<ProductsModel>(
      model: ProductsModel(),
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.deepOrange,
          primaryColor: Colors.deepPurple,
          buttonTheme: const ButtonThemeData(
            buttonColor: Colors.deepOrange,
          ),
          // fontFamily: 'Oswald'
        ),
        // home: const AuthPage(),
        routes: {
          '/': (BuildContext context) => const AuthPage(),
          '/home': (BuildContext context) => const HomePage(),
          '/admin': (BuildContext context) => const AdminPage(),
        },
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name == null) return null;

          final List<String> pathElements = settings.name!.split('/');
          if (pathElements[0] != '') return null;
          if (pathElements[1] == 'product') {
            final int index = int.parse(pathElements[2]);
            return MaterialPageRoute<bool>(
              builder: (BuildContext ctx) => ProductPage(index),
            );
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => const HomePage());
        },
      ),
    );
  }
}
