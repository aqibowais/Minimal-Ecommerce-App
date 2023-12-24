import 'package:flutter/material.dart';
import 'package:minimal_ecom/components/my_drawer.dart';
import 'package:minimal_ecom/components/product_tile.dart';
import 'package:minimal_ecom/models/shop.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final products = Shop().shop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text("My Shop"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cart_page'),
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 25,
              ),
            ),
          )
        ],
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(children: [
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shop",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Text(
                "Pick from a selected list of premium products ",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 550,
          child: ListView.builder(
            padding: const EdgeInsets.all(15),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final item = products[index];
              return ProductTile(item: item);
            },
          ),
        ),
      ]),
    );
  }
}
