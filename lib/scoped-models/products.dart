import 'package:scoped_model/scoped_model.dart';
import 'package:first_app/models/product.dart';

class ProductsModel extends Model {
  final List<Product> _products = [];
  int _selectedProductIndex = -1;

  List<Product> get products => List.from(_products); // Don't return pointer of actual address
  int get selectedProductIndex => _selectedProductIndex;

  Product? get selectedProduct {
    if (_selectedProductIndex == -1) {
      return null;
    }
    return _products[selectedProductIndex];
  }

  void addProduct(Product product) {
    _products.add(product);
    _selectedProductIndex = -1;
  }

  void deleteProduct(int index) {
    _products.removeAt(index);
    _selectedProductIndex = -1;
  }

  void updateProduct(Product product) {
    _products[_selectedProductIndex] = product;
    _selectedProductIndex = -1;
  }

  void selectProduct(int index) {
    _selectedProductIndex = index;
  }
}
