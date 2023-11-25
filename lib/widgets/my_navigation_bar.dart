// lib/widgets/my_navigation_bar.dart
import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:shopping_app/pages/search_screen.dart';
import 'package:shopping_app/pages/favorite_screen.dart';
import 'package:shopping_app/pages/cart_screen.dart';
import 'package:shopping_app/pages/home.dart';


class MyNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(69)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
          icon: const Icon(
            FeatherIcons.home,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchScreen()),
            );
          },
          icon: const Icon(
            FeatherIcons.search,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavoriteScreen()),
            );
          },
          icon: const Icon(
            FeatherIcons.heart,
            size: 30,
          ),
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
              icon: const Icon(
                FeatherIcons.shoppingCart,
                size: 30,
              ),
            ),
            const Positioned(
              right: 1,
              top: 1,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 10,
                child: Text(
                  "1",
                  style: TextStyle(fontSize: 13),
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}
