import 'package:first_app/scoped-models/products.dart';
import 'package:first_app/widgets/products/address_tag.dart';
import 'package:first_app/widgets/products/price_tag.dart';
import 'package:first_app/widgets/ui_elements/title_default.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:first_app/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final int productIndex;
  final Product product;

  const ProductCard(this.product, this.productIndex, {super.key});

  Widget _buildActionButtons(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.info),
          onPressed: () =>
              Navigator.pushNamed<bool>(context, '/product/$productIndex'),
        ),
        ScopedModelDescendant(builder:
            (BuildContext context, Widget? widget, ProductsModel model) {
          final bool isFavorite = model.products[productIndex].isFavorite;
          return IconButton(
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Colors.red,
              onPressed: () {
                model.selectProduct(productIndex);
                model.toggleProductFavoriteStatus();
              });
        }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(product.imageUrl),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TitleDefault(product.title),
                const SizedBox(
                  width: 8.0,
                ),
                PriceTag(product.price.toString()),
              ],
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          const AddressTag("New York, Time Squre"),
          _buildActionButtons(context),
        ],
      ),
    );
  }
}
