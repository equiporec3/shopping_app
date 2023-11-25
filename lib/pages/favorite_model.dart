import 'package:flutter/foundation.dart';

class FavoriteModel extends ChangeNotifier {
  List<String> _favorites = [];

  List<String> get favorites => _favorites;

  void addToFavorites(String productName) {
    _favorites.add(productName);
    notifyListeners();
  }

  void removeFromFavorites(String productName) {
    _favorites.remove(productName);
    notifyListeners();
  }
}
