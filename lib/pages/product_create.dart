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
  String _titleValue = '';
  double _priceValue = 0.0;
  String _descriptionValue = '';
  bool _hasImage = false;

  Widget _buildTitleTextField() {
    return TextField(
      decoration: const InputDecoration(
        hintText: "Super Cake",
        labelText: "Product Name",
      ),
      onChanged: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextField(
      maxLines: 4,
      decoration: const InputDecoration(
        hintText: "This cake is build with heart",
        labelText: "Product Description",
      ),
      onChanged: (String value) {
        setState(() {
          _descriptionValue = value;
        });
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: "19.99",
        labelText: "Product Price",
      ),
      onChanged: (String value) {
        setState(() {
          _priceValue = double.parse(value);
        });
      },
    );
  }

  void _submitForm() {
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'price': _priceValue,
      'description': _descriptionValue,
      'imageUrl': 'assets/food.jpg'
    };
    widget.addProduct(product);
    Navigator.pushNamed(context, "/");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          _buildTitleTextField(),
          _buildDescriptionTextField(),
          _buildPriceTextField(),
          const SizedBox(
            height: 10,
          ),
          SwitchListTile(
            value: _hasImage,
            onChanged: (bool value) {
              setState(() {
                _hasImage = value;
              });
            },
            title: const Text("Has Picture"),
          ),
          ElevatedButton(onPressed: _submitForm, child: const Text("Save")),
        ],
      ),
    );
  }
}
