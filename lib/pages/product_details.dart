import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/prod.dart';
import 'package:shopping_app/widgets/my_app_bar.dart';
import 'package:shopping_app/widgets/my_navigation_bar.dart';
import 'package:shopping_app/models/shopping_cart.dart';
import 'package:shopping_app/pages/favorite_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/pages/confirm_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Prod product;
  final Function(String, bool) onFavoriteChanged;

  const ProductDetailsScreen({required this.product, required this.onFavoriteChanged});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: MyAppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Mostrar la imagen del producto
                Image.asset(
                  "assets/images/${widget.product.imagePath}",
                  fit: BoxFit.contain,
                  width: 250,
                  height: 250,
                ),
                SizedBox(height: 16),
                Text(
                  widget.product.name,
                  style: GoogleFonts.playfairDisplay(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Descripción: ${widget.product.description}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Precio: \$${widget.product.price.toStringAsFixed(2)}',
                  style: GoogleFonts.workSans(fontSize: 18),
                ),
                // Botones para agregar al carrito y comprar
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Lógica para agregar al carrito
                        ShoppingCart().items.add(widget.product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${widget.product.name} agregado al carrito'),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                      ),
                      child: Text('Agregar al carrito'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Lógica para comprar
                        // Puedes implementar la lógica aquí
                        print('Comprado: ${widget.product.name}');

                        // Obtener el modelo FavoriteModel
                        FavoriteModel favoriteModel = Provider.of<FavoriteModel>(context, listen: false);

                        // Añadir el producto a la lista de favoritos
                        favoriteModel.addToFavorites(widget.product.name);

                        // Navegar a la pantalla ConfirmScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfirmScreen(
                              total: widget.product.price,
                              productNames: [widget.product.name],
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 3, 3),
                      ),
                      child: Text('Comprar'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                      // Llama a la función de retorno para agregar o quitar el producto de la lista de favoritos
                      widget.onFavoriteChanged(widget.product.name, isFavorite);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: isFavorite ? Colors.red : Colors.grey, // Cambia el color basado en si es favorito o no
                  ),
                  child: Text(isFavorite ? 'Quitar de favoritos' : 'Agregar a favoritos'),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}
