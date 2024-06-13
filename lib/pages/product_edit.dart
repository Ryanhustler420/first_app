import 'package:first_app/scoped-models/products.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:first_app/models/product.dart';
import 'package:flutter/material.dart';

class ProductEditPage extends StatefulWidget {
  const ProductEditPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {
    'title': null,
    'price': null,
    'description': null,
    'imageUrl': 'assets/food.jpg',
  };

  bool _hasImage = false;

  Widget _buildTitleTextField(Product? product) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: "Super Cake",
        labelText: "Product Name",
      ),
      initialValue: product == null ? "" : product.title,
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

  Widget _buildDescriptionTextField(Product? product) {
    return TextFormField(
      maxLines: 4,
      decoration: const InputDecoration(
        hintText: "This cake is build with heart",
        labelText: "Product Description",
      ),
      initialValue: product == null ? "" : product.description,
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

  Widget _buildPriceTextField(Product? product) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: "19.99",
        labelText: "Product Price",
      ),
      initialValue: product == null ? "" : product.price.toString(),
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

  void _submitForm(int selectedProductIndex, Function addProduct, Function updateProduct) {
    if (_formKey.currentState?.validate() == false) return;
    _formKey.currentState?.save();
    Product pass = Product(
      title: _formData['title'],
      price: _formData['price'],
      imageUrl: _formData['imageUrl'],
      description: _formData['description'],
    );
    if (selectedProductIndex == -1) {
      addProduct(pass);
    } else {
      updateProduct(pass);
    }
    Navigator.pushNamed(context, "/home");
  }

  Widget _buildSubmitButton() {
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget? widget, ProductsModel model) {
        return ElevatedButton(
          onPressed: () => _submitForm(model.selectedProductIndex, model.addProduct, model.updateProduct),
          child: const Text("Save"),
        );
      },
    );
  }

  Widget _buildPageContent(BuildContext context, Product? product) {
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
              _buildTitleTextField(product),
              _buildDescriptionTextField(product),
              _buildPriceTextField(product),
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
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget? widget, ProductsModel model) {
        final Widget pageContent = _buildPageContent(context, model.selectedProduct);
        return model.selectedProductIndex == -1
            ? pageContent
            : Scaffold(
                appBar: AppBar(
                  title: const Text("Edit Product"),
                ),
                body: pageContent,
              );
      },
    );
  }
}
