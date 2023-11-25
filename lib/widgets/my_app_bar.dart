import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/pages/login_signup_screen.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 90,
      elevation: 0,
      title: Text("Amazon't",
          style: GoogleFonts.vinaSans(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 35,
              fontWeight: FontWeight.normal)),
      backgroundColor: const Color.fromRGBO(35, 47, 62, 1),

      actions: [
        InkWell(
          onTap: () {
            // Navegar a la pantalla de inicio de sesión/registro
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AuthScreen(),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(right: 12),
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
                color: Colors.black, shape: BoxShape.circle),
            child: Image.asset("assets/images/avatar.png", fit: BoxFit.contain),
          ),
        ),
      ],
    );
  }
}
