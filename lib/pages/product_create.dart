import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  const ProductCreatePage({super.key});

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
      child: Column(
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
          Text(titleValue),
        ],
      ),
    );
  }
}
