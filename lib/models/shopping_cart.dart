import 'prod.dart';
import 'package:flutter/foundation.dart'; // Importante para usar ChangeNotifier

class ShoppingCart extends ChangeNotifier {
  static final ShoppingCart _instance = ShoppingCart._internal();

  factory ShoppingCart() {
    return _instance;
  }

  ShoppingCart._internal();

  List<Prod> items = [];

  void addItemToCart(Prod product) {
    items.add(product);
    notifyListeners(); // Notificar a los oyentes (en este caso, la interfaz de usuario) sobre cambios en el estado
  }

  void removeItemFromCart(int index) {
    if (index >= 0 && index < items.length) {
      items.removeAt(index);
      notifyListeners(); // Notificar a los oyentes sobre cambios en el estado
    }
  }

  void clearCart() {
    items.clear();
    notifyListeners(); // Notificar a los oyentes sobre cambios en el estado
  }
}
