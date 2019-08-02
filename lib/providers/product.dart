import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String title;
  final String id;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourite;

  Product(
      {@required this.title,
      @required this.id,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      this.isFavourite = false, bool isFavorite});

  void toggleFavouriteStatus() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
