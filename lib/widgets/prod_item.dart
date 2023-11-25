import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/models/prod.dart';

class ProdItem extends StatelessWidget {
  final Prod prod;
  final Function(String, bool) onFavoriteChanged;

  const ProdItem({
    required this.prod,
    required this.onFavoriteChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF1F1F1),
      child: Stack(
        children: [
          Positioned(
            right: 1,
            top: 1,
            child: Padding(
              padding: EdgeInsets.only(top: 6, right: 9),
              child: GestureDetector(
                onTap: () {
                  // Aquí es donde gestionas el cambio de favorito
                  onFavoriteChanged(prod.name, !prod.isFavorite);
                },
                child: Icon(
                  prod.isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 20,
                  color: prod.isFavorite ? Colors.red : null,
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/${prod.imagePath}",
                  fit: BoxFit.contain,
                  width: 111,
                  height: 111,
                ),
                const SizedBox(
                  height: 11,
                ),
                Text(
                  prod.name,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  "\$${prod.price.toStringAsFixed(2)}",
                  style: GoogleFonts.workSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  height: 2,
                  width: 88,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
