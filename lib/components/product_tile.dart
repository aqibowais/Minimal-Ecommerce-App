import 'package:flutter/material.dart';
import 'package:minimal_ecom/models/products.dart';
import 'package:minimal_ecom/models/shop.dart';

class ProductTile extends StatelessWidget {
  final Product item;
  const ProductTile({
    super.key,
    required this.item,
  });
  void addingInCart(BuildContext context) {
    final shop = Shop();
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text("Add this item to your cart"),
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
                    shop.addToCart(item);
                  },
                  child: const Text("Yes"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //product img
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      item.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              //name
              Text(
                item.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //description
              Text(
                item.description,
                maxLines: 4,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          //price + add to cart
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${item.price.toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  highlightColor: Theme.of(context).colorScheme.primary,
                  onPressed: () {
                    addingInCart(context);
                  },
                  icon: const Icon(Icons.add),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
