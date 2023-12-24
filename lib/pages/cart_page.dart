import 'package:flutter/material.dart';
import 'package:minimal_ecom/components/my_button.dart';
import 'package:minimal_ecom/models/products.dart';
import 'package:minimal_ecom/models/shop.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  // void removingFromCart(BuildContext context, Product item) {
  //   Shop shop = Shop();
  //   showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //             content: const Text("Remove this item to your cart"),
  //             actions: [
  //               //No
  //               MaterialButton(
  //                 onPressed: () => Navigator.pop(context),
  //                 child: const Text("Cancel"),
  //               ),
  //               //yes
  //               MaterialButton(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                   shop.removeFromCart(item);
  //                 },
  //                 child: const Text("Yes"),
  //               )
  //             ],
  //           ));
  //   shop.addToCart(item);
  // }

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final shop = Shop();

  void removingFromCart(BuildContext context, Product item) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text("Remove this item to your cart"),
              actions: [
                //No
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                //yes
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      shop.removeFromCart(item);
                    });
                  },
                  child: const Text("Yes"),
                )
              ],
            ));
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Text(
                  "User wants to pay! Connect this app to your payment backend "),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: shop.cart.isEmpty
                ? const Center(child: Text("Your cart is empty...."))
                : ListView.builder(
                    itemCount: shop.cart.length,
                    itemBuilder: (context, index) {
                      final item = shop.cart[index];
                      // print(item.name);
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                        leading: CircleAvatar(
                            child: Image(image: AssetImage(item.imagePath))),
                        trailing: IconButton(
                            onPressed: () => removingFromCart(context, item),
                            icon: const Icon(Icons.delete_outline)),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
                onTap: () => payButtonPressed(context),
                child: const Text("PAY NOW")),
          )
        ],
      ),
    );
  }
}
