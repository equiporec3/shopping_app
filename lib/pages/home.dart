import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/models/prod.dart';
import 'package:shopping_app/widgets/my_app_bar.dart';
import 'package:shopping_app/widgets/my_navigation_bar.dart';
import 'package:shopping_app/widgets/prod_item.dart';
import 'product_details.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Prod> prods = Catalog();
  List<String> heroImages = [
    "assets/images/hero3.png",
    "assets/images/hero1.jpg",
  ];

  List<String> favoriteProducts = [];

void handleFavoriteChanged(String productName, bool isFavorite) {
  setState(() {
    if (isFavorite) {
      // Agrega el producto a la lista de favoritos
      favoriteProducts.add(productName);
      print('$productName añadido a favoritos');
    } else {
      // Remueve el producto de la lista de favoritos
      favoriteProducts.remove(productName);
      print('$productName eliminado de favoritos');
    }
  });
}

  final controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: MyAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            carousel(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 35),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: prods.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 230,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 13,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navegar a la pantalla de detalles del producto
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(
                            product: prods[index],
                            onFavoriteChanged: (productName, isFavorite) {
                              handleFavoriteChanged(productName, isFavorite);
                            },
                          ),
                        ),
                      );
                    },
                    child: ProdItem(
                              prod: prods[index],
                              onFavoriteChanged: (productName, isFavorite) {
                                  handleFavoriteChanged(productName, isFavorite);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }

  Widget carousel() {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          itemCount: heroImages.length,
          options: CarouselOptions(
            viewportFraction: 1,
            height: 230,
            enableInfiniteScroll: true,
          ),
          itemBuilder: (context, index, realIndex) {
            return Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 12, right: 12, bottom: 0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(heroImages[index]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
              ),
            );
          },
        ),
        Positioned(
          bottom: 1,
          right: 22,
          child: Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(50, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed: previousPage,
                child: const Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
              ),
              const SizedBox(width: 3),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(50, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed: nextPage,
                child: const Icon(
                  Icons.arrow_forward,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void previousPage() {
    controller.previousPage(duration: const Duration(milliseconds: 400));
  }

  void nextPage() {
    controller.nextPage(duration: const Duration(milliseconds: 400));
  }
}
