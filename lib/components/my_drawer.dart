import 'package:flutter/material.dart';
import 'package:minimal_ecom/components/list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //drawer header
              DrawerHeader(
                child: Icon(
                  Icons.shopping_bag,
                  size: 72,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

              //shop tile
              MyListTile(
                title: "Shop",
                icon: Icons.home,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              //cart tile
              MyListTile(
                title: "Cart",
                icon: Icons.shopping_cart,
                onTap: () {
                  //pop
                  Navigator.pop(context);
                  //go to cart page
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
              MyListTile(
                title: "Settings",
                icon: Icons.settings,
                onTap: () {
                  //pop
                  Navigator.pop(context);
                  //go to cart page
                  Navigator.pushNamed(context, '/setting_page');
                },
              ),
            ],
          ),

          //exit tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              title: "Exit",
              icon: Icons.logout,
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/intro_page', (route) => false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
