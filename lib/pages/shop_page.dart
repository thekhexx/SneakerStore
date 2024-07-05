import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/shoe_tile.dart';
import '../models/shoe.dart';
import '../models/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // Add item to cart method
  void addItemToCart(Shoe shoe) {
    // Add to cart
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // Alert User
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Successfully added!',textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleLarge,),
        content: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text('You can see it in your cart',textAlign: TextAlign.center,  style: Theme.of(context).textTheme.titleMedium,),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, cart, child) => Column(
              children: [
                // SearchBar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0),
                      ),
                    ),
                  ),
                ),

                // Message
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Text(
                    'everyone flies.. some fly longer than others',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),

                // Hot Picks
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Hot Picks 🔥',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        'See all',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // List Of shoes for sale
                Expanded(
                    child: ListView.builder(
                        itemCount: cart.getShoeList().length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          Shoe shoe = cart.getShoeList()[index];
                          return ShoeTile(
                            shoe: shoe,
                            onTap: () => addItemToCart(shoe),
                          );
                        })),
              ],
            ));
  }
}
