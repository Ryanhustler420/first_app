class Product {
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final bool isFavorite;

  Product(
      {required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      this.isFavorite = false});
}
