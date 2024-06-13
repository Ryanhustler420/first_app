import 'package:scoped_model/scoped_model.dart';
import 'package:first_app/models/product.dart';

class ProductsModel extends Model {
  final List<Product> _products = [];
  int _selectedProductIndex = -1;
  bool _showFavorites = false;

  List<Product> get displayProducts {
    if (_showFavorites) {
      return _products.where((Product e) => e.isFavorite).toList();
    }
    return List.from(_products);
  }
  List<Product> get products =>
      List.from(_products); // Don't return pointer of actual address
  int get selectedProductIndex => _selectedProductIndex;
  bool get selectedFavorites => _showFavorites;

  Product? get selectedProduct {
    if (_selectedProductIndex == -1) {
      return null;
    }
    return _products[selectedProductIndex];
  }

  void addProduct(Product product) {
    _products.add(product);
    _selectedProductIndex = -1;
    notifyListeners();
  }

  void deleteProduct(int index) {
    _products.removeAt(index);
    _selectedProductIndex = -1;
    notifyListeners();
  }

  void updateProduct(Product product) {
    _products[_selectedProductIndex] = product;
    _selectedProductIndex = -1;
    notifyListeners();
  }

  void toggleProductFavoriteStatus() {
    if (selectedProduct == null) return;
    final bool isCurrentlyFavorite = selectedProduct!.isFavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Product updatedProduct = Product(
        title: selectedProduct!.title,
        description: selectedProduct!.description,
        imageUrl: selectedProduct!.imageUrl,
        price: selectedProduct!.price,
        isFavorite: newFavoriteStatus);
    _products[_selectedProductIndex] = updatedProduct;
    _selectedProductIndex = -1;
    notifyListeners();
  }

  void toggleDisplayMode() {
    _showFavorites =!_showFavorites;
    notifyListeners();
  }

  void selectProduct(int index) {
    _selectedProductIndex = index;
    notifyListeners();
  }
}
