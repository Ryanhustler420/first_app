import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct, deleteProduct;
  const ProductCreatePage(this.addProduct, this.deleteProduct, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String titleValue = '';
  double priceValue = 0.0;
  String descriptionValue = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: const InputDecoration(
              hintText: "Super Cake",
              labelText: "Product Name",
            ),
            onChanged: (String value) {
              setState(() {
                titleValue = value;
              });
            },
          ),
          TextField(
            maxLines: 4,
            decoration: const InputDecoration(
              hintText: "This cake is build with heart",
              labelText: "Product Description",
            ),
            onChanged: (String value) {
              setState(() {
                descriptionValue = value;
              });
            },
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "19.99",
              labelText: "Product Price",
            ),
            onChanged: (String value) {
              setState(() {
                priceValue = double.parse(value);
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                final Map<String, dynamic> product = {
                  'title': titleValue,
                  'price': priceValue,
                  'description': descriptionValue,
                  'imageUrl': 'assets/food.jpg'
                };
                widget.addProduct(product);
                Navigator.pushNamed(context, "/");
              },
              child: const Text("Save")),
        ],
      ),
    );
  }
}
