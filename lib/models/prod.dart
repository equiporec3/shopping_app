class Prod {
  String name;
  String imagePath;
  String description; // Nuevo campo para la descripción del producto
  double price;
  int category; // Identificador único para el producto
  int id; // Identificador único para el producto
  bool isFavorite; // Nueva propiedad para rastrear si el producto es favorito



  Prod({
    required this.name,
    required this.imagePath,
    required this.description,
    required this.price,
    required this.category,
    required this.id,
    this.isFavorite = false, // Por defecto, el producto no es favorito

  });
}

List<Prod> Catalog() {
  return [
    Prod(name: "Nikon D 3100",
         imagePath: "cam1.png",
         description: "Camara Reflex de 32mp, peso de 505 g y  dimensiones de 124 x 96 x 75 mm",
         price: 3000,
         category: 1,
         id: 1),
    Prod(name: "Canon Eos 550D", 
         imagePath: "cam2.png", 
         description: "Camara digital con Sensor CMOS APS-C de 18 MP, ISO 100-6400, H:12800, disparo en ráfaga a 3.7 fps, vídeos Full HD LCD Clear View con formato 3:2 de 7,7 cm (3,0 ”) y 1.040.000 píxeles",
         price: 6000,        
         category: 1, 
         id: 2),
    Prod(name: "MSI GTX 1650/i5",
         imagePath: "lap1.png",
         description: "Laptop marca MSI, procesador Core Intel i5-1005, tarjeta gráfica GeForce GTX 1650, 16 GB RAM hasta 32 expandibles, 256 GB memoria SSD",
         price: 14000,         
         category: 2,
         id: 3),
    Prod(name: "Corsair Voyager 1600",
         imagePath: "lap2.png",
         description: "Portátil para juegos CORSAIR VOYAGER a1600 AMD Advantage Edition, Ryzen R7, Radeon 6800M, 16 GB de DDR5, M.2 de 1 TB, pantalla de 16 pulgadas y 240 Hz, Win11 Home",
         price: 20000,
         category: 2,
         id: 4),
    Prod(name: "Acer Nitro",
         imagePath: "lap3.png",
         description: "Laptop acer Nitro 5 AN515-58-525P Gaming Laptop, Intel Core i5-12500H, NVIDIA GeForce RTX 3050, 15.6 FHD 144Hz IPS Display, 8GB DDR, 512GB SSD",
         price: 12000,
         category: 2,
         id:5),
    Prod(name: "Aorus 15 BSF", 
         imagePath: "lap4.png",
         description: "",
         price: 14000,    
         category: 2,     
         id: 6),
    Prod(name: "Iphone 15 Pro Max",
         imagePath: "cel1.png",
         description: "512 Gb de Alacenamiento, dimensiones de 126 x 70 x 8 mm, pantalla de 6.7 pulgadas, chip a17 pro, cámara de 48mp",
         price: 15000,  
         category: 3,       
         id: 7),
    Prod(name: "Samsung Galaxy S23",
         imagePath: "cel2.png",
         description: "SAMSUNG Galaxy S23 5G SM-S911B/DS 128GB 8GB RAM, Cámara de 50 MP, Desbloqueado de fábrica - Verde, SM-S911",
         price: 13500,
         category: 3,
         id: 8),
    Prod(name: "Xiaomi 13",
         imagePath: "cel3.png",
         description: "Smartphone de 16+1TB, Pantalla 6.67pulgadas AMOLED CrystalRes 1,5K+144Hz, Carga Turbo 20W, Batería 5000mAh, Negro",
         price: 9999,     
         category: 3,    
         id: 9),
    Prod(name: "Nokia 3310",
         imagePath: "cel4.png",
         description: "Celular para llamadas y recibir mensajes, indestructible y sirve como martillo",
         price: 200,
         category: 3,
         id: 10),

  ];
}
