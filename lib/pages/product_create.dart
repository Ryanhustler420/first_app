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
  final Map<String, dynamic> _formData = {
    'title': null,
    'price': null,
    'description': null,
    'imageUrl': 'assets/food.jpg',
  };

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
        if (value != null) _formData['title'] = value;
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
        if (value != null) _formData['description'] = value;
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
        if (value != null) _formData['price'] = double.parse(value);
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() == false) return;
    _formKey.currentState?.save();
    widget.addProduct(_formData);
    Navigator.pushNamed(context, "/home");
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 786.0 ? 500.0 : deviceWidth;
    final double targetPadding = deviceWidth - targetWidth;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
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
      ),
    );
  }
}
