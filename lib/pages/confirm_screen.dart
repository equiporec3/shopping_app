import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/pages/thanks_screen.dart';
class ConfirmScreen extends StatelessWidget {
  final double total;
  final List<String> productNames;

  ConfirmScreen({required this.total, required this.productNames});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        elevation: 0,
        title: Text(
          "Amazon't",
          style: GoogleFonts.vinaSans(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 35,
            fontWeight: FontWeight.normal,
          ),
        ),
        backgroundColor: const Color.fromRGBO(35, 47, 62, 1),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('¡Compra confirmada!', style: TextStyle(fontSize: 24)),
              SizedBox(height: 16),
              Container(
                height: 2,
                width: 160,
                color: Colors.black,
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(height: 16),
              Text('Compraras los siguientes productos:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              SizedBox(height: 16),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: productNames.map((productName) => Text(productName, style: TextStyle(fontSize: 16))).toList(),
                ),
              ),
              SizedBox(height: 16),
              Text('Total: \$${total.toStringAsFixed(2)}', style: GoogleFonts.playfairDisplay(fontSize: 24, fontWeight: FontWeight.bold),),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Lógica para confirmar la compra
                  print('Compra confirmada. Total: \$${total.toStringAsFixed(2)}');

                  // Navegar a la pantalla ThanksScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThanksScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 0, 0),
                ),
                child: Text('Aceptar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
