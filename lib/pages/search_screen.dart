import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/my_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/models/prod.dart'; // Importa el archivo prod.dart
import 'product_details.dart';
import 'package:shopping_app/widgets/my_app_bar.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Obtén la lista de productos
  final List<Prod> productList = Catalog();
  String selectedCategory = ''; // Eliminamos esta línea

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        elevation: 0,
        title: Text("Amazon't",
            style: GoogleFonts.vinaSans(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 35,
                fontWeight: FontWeight.normal)),
        backgroundColor: const Color.fromRGBO(35, 47, 62, 1),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Agregar aquí la lógica para activar la barra de búsqueda
              showSearch(context: context, delegate: DataSearch(productList));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Categorías',
              style: GoogleFonts.playfairDisplay(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),
          // Separador
          Divider(
            color: Colors.grey,
            thickness: 1,
            height: 1,
          ),
          // Texto "Cámaras"
          ListTile(
            title: Text(
              'Cámaras',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // Navegar a la lista de productos de la categoría 1 (Cámaras)
              navigateToCategory(context, 1); // Actualizamos aquí
            },
          ),
          // Separador
          Divider(
            color: Colors.grey,
            thickness: 1,
            height: 1,
          ),
          // Texto "Laptops"
          ListTile(
            title: Text(
              'Laptops',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // Navegar a la lista de productos de la categoría 2 (Laptops)
              navigateToCategory(context, 2); // Actualizamos aquí
            },
          ),
          // Separador
          Divider(
            color: Colors.grey,
            thickness: 1,
            height: 1,
          ),
          // Texto "Celulares"
          ListTile(
            title: Text(
              'Celulares',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // Navegar a la lista de productos de la categoría 3 (Celulares)
              navigateToCategory(context, 3); // Actualizamos aquí
            },
          ),
          // Otro contenido de la pantalla de búsqueda
        ],
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }

  // Método para navegar a la lista de productos de una categoría específica
  void navigateToCategory(BuildContext context, int category) {
    // Filtrar la lista de productos por la categoría seleccionada
    final categoryProducts =
        productList.where((product) => product.category == category).toList();

    // Navegar a la pantalla que muestra la lista de productos de la categoría
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryScreen(products: categoryProducts, selectedCategory: getCategoryName(category)), // Actualizamos aquí
      ),
    );
  }

  // Método para obtener el nombre de la categoría según su número
  String getCategoryName(int category) {
    switch (category) {
      case 1:
        return 'Cámaras';
      case 2:
        return 'Laptops';
      case 3:
        return 'Celulares';
      default:
        return '';
    }
  }
}



// Clase para gestionar la búsqueda
class DataSearch extends SearchDelegate<String> {
  final List<Prod> productList; // Lista de productos

  DataSearch(this.productList); // Constructor para recibir la lista

  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones para el campo de búsqueda (limpiar, cancelar, etc.)
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Acción para el ícono de "atrás" en la esquina izquierda
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        // Devuelve una cadena vacía al cerrar la pantalla de búsqueda
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = productList
        .where((product) => product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Cierra la pantalla de búsqueda antes de navegar a los detalles del producto
            close(context, '');
            // Navega a la pantalla de detalles del producto
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(
                  product: results[index],
                  onFavoriteChanged: (productName, isFavorite) {
                    // No hacer nada en SearchScreen, ya que no maneja favoritos
                  },
                ),
              ),
            );
          },
          child: ListTile(
            title: Text(results[index].name),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Puedes mostrar sugerencias basadas en la cadena de consulta aquí
    final suggestions = productList
        .where((product) => product.name.toLowerCase().startsWith(query.toLowerCase()))
        .map((product) => product.name)
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
        );
      },
    );
  }
}

// Nueva pantalla para mostrar la lista de productos de una categoría
class CategoryScreen extends StatelessWidget {
  final List<Prod> products;
  final String selectedCategory;

  CategoryScreen({required this.products, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: MyAppBar(),
      ),
      body: Column(
        children: [
          // Mostrar la categoría seleccionada
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            
            child: Text(
              '$selectedCategory',
              style: GoogleFonts.playfairDisplay(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),          // Lista de productos con separadores
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(products[index].name),
                      onTap: () {
                        // Navegar a la pantalla de detalles del producto
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                              product: products[index],
                              onFavoriteChanged: (productName, isFavorite) {
                                // No hacer nada en CategoryScreen, ya que no maneja favoritos
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    // Separador entre productos
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                      height: 1,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}