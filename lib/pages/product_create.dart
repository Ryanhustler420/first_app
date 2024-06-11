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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _titleValue = '';
  double _priceValue = 0.0;
  String _descriptionValue = '';
  bool _hasImage = false;

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: "Super Cake",
        labelText: "Product Name",
      ),
      validator: (String? value) {
        if (value != null && (value.isEmpty == true || value.length < 5)) {
          return 'Title is required and should be 5+ character long';
        }
      },
      onSaved: (String? value) {
        setState(() {
          if (value != null) _titleValue = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      maxLines: 4,
      decoration: const InputDecoration(
        hintText: "This cake is build with heart",
        labelText: "Product Description",
      ),
      validator: (String? value) {
        if (value != null && (value.isEmpty == true || value.length < 10)) {
          return 'Description is required and should be 10+ character long';
        }
      },
      onSaved: (String? value) {
        setState(() {
          if (value != null) _descriptionValue = value;
        });
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: "19.99",
        labelText: "Product Price",
      ),
      validator: (String? value) {
        if (value != null &&
            (value.isEmpty == true ||
                !RegExp(r'(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value))) {
          return 'Price is required and should be number';
        }
      },
      onSaved: (String? value) {
        setState(() {
          if (value != null) _priceValue = double.parse(value);
        });
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() == false) return;
    _formKey.currentState?.save();
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'price': _priceValue,
      'description': _descriptionValue,
      'imageUrl': 'assets/food.jpg'
    };
    widget.addProduct(product);
    Navigator.pushNamed(context, "/home");
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 786.0 ? 500.0 : deviceWidth;
    final double targetPadding = deviceWidth - targetWidth;

    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
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
            // GestureDetector(
            //   onTap: _submitForm,
            //   child: Container(
            //     color: Colors.green,
            //     padding: const EdgeInsets.all(5.0),
            //     child: const Text("My Button"),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
