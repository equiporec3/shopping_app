import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/shopping_cart.dart';
import 'package:shopping_app/pages/favorite_model.dart';  // Asegúrate de importar tu modelo FavoriteModel
import 'package:shopping_app/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShoppingCart()),
        ChangeNotifierProvider(create: (_) => FavoriteModel()),  // Añade FavoriteModel al MultiProvider
      ],
      child: MaterialApp(
        title: 'Shopping App',
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}