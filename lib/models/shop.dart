import 'package:minimal_ecom/models/products.dart';

class Shop {
  static final Shop _instance = Shop._internal();

  factory Shop() {
    return _instance;
  }

  Shop._internal();
  //products for sale
  final List<Product> _shop = [
    Product(
        name: "Smart Watch Ultra9 Series",
        price: 99.87,
        description:
            "It is a wrist-worn device that connects to your phone, offering features like fitness tracking, calls, texts, and more in a compact, wearable form.",
        imagePath: 'assets/watchs.png'),
    Product(
        name: "Nike Air Force 1",
        price: 79.99,
        description:
            " Step into comfort and fashion with these premium shoes, marrying classic design with contemporary comfort for all-day wear.",
        imagePath: 'assets/shoes1.png'),
    Product(
        name: "Trendy Vision Glasses",
        price: 49.99,
        description:
            "Elevate your style with these sleek and trendy glasses, offering a perfect blend of sophistication and modern design.",
        imagePath: 'assets/glasses.png'),
    Product(
        name: "Cozy Comfort Hoodie",
        price: 39.99,
        description:
            "Stay cozy yet stylish with this versatile hoodie, crafted for comfort and effortless fashion, ideal for any occasion.",
        imagePath: 'assets/hoodie.png')
  ];

  //user cart
  final List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;
  //get cart list
  List<Product> get cart => _cart;

  //add item to the cart
  void addToCart(Product item) {
    _cart.add(item);
  }

  //remove item from the card
  void removeFromCart(Product item) {
    _cart.remove(item);
  }

  //theme
  bool themetoggle(bool isDarkMode) {
    isDarkMode = !isDarkMode;
    return isDarkMode;
  }
}
