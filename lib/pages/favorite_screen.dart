import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/my_app_bar.dart';
import 'package:shopping_app/widgets/my_navigation_bar.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  Set<String> favoriteProducts = Set<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: MyAppBar(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('This is the favorites screen'),
          // Mostrar la lista de productos favoritos
          if (favoriteProducts.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: favoriteProducts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(favoriteProducts.elementAt(index)),
                    // Otros detalles del producto, si es necesario
                  );
                },
              ),
            ),
          if (favoriteProducts.isEmpty)
            Text('No hay productos favoritos.'),
        ],
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }

  void onFavoriteChanged(String productName, bool isFavorite) {
    setState(() {
      if (isFavorite) {
        favoriteProducts.add(productName);
      } else {
        favoriteProducts.remove(productName);
      }
    });
  }
}
