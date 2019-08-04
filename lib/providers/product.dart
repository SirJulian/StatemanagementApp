import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
      this.isFavourite = false,
      bool isFavorite});

  Future <void> toggleFavouriteStatus() async {
    final oldStatus = isFavourite;
    isFavourite = !isFavourite;
    notifyListeners();
    final url =
        'https://statemanagement-academind.firebaseio.com/products/$id.json';
    try {
      await http.patch(
        url,
        body: json.encode({
          "isFavorite": isFavourite,
        }),
      );
    } catch (error) {
      isFavourite = oldStatus;
      notifyListeners();
    }
  }
}
