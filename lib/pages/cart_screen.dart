import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/prod.dart';
import 'package:shopping_app/widgets/my_app_bar.dart';
import 'package:shopping_app/widgets/my_navigation_bar.dart';
import 'package:shopping_app/models/shopping_cart.dart';
import 'package:shopping_app/pages/confirm_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartItems = Provider.of<ShoppingCart>(context).items;

    // Calcular el total de la compra
    double total = cartItems.fold(0, (previousValue, element) => previousValue + element.price);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: MyAppBar(),
      ),
body: SingleChildScrollView(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(height: 16),
      Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Text(
          'Artículos en el carrito de compras',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Divider(thickness: 1, color: Colors.grey),

      // Lista de productos en el carrito con líneas divisoria entre ellos
      Container(
        height: 345, // Ajusta la altura máxima según tus necesidades
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            Prod product = cartItems[index];
            return Column(
              children: [
                ListTile(
                  title: Text(product.name),
                  subtitle: Text('Precio: \$${product.price.toStringAsFixed(2)}',
                    style: GoogleFonts.workSans( )
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      Provider.of<ShoppingCart>(context, listen: false).removeItemFromCart(index);
                    },
                  ),
                ),
                Divider(thickness: 1, color: Colors.grey),
              ],
            );
          },
        ),
      ),
      
      // Mostrar el total de la compra a la izquierda
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Total: \$${total.toStringAsFixed(2)}'),
        ),
      ),
      
      // Botón para confirmar la compra a la derecha
      Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: 
            ElevatedButton(
              onPressed: () {
                // Lógica para confirmar la compra
                // Puedes implementar la lógica aquí
                print('Compra confirmada. Total: \$${total.toStringAsFixed(2)}');

                // Obtener la lista de nombres de productos
                List<String> productNames = cartItems.map((product) => product.name).toList();

                // Navegar a la pantalla ConfirmScreen con la información necesaria
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmScreen(total: total, productNames: productNames),
                  ),
                );
              },
              child: Text('Confirmar Compra'),
            ),
        ),
      ),
    ],
  ),
),

      bottomNavigationBar: MyNavigationBar(),
    );
  }
}
