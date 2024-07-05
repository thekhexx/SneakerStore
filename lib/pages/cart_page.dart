import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_store/models/cart.dart';
import 'package:sneaker_store/components/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(children: [
          // Header
          Text('My Cart', style: Theme.of(context).textTheme.titleLarge,),

          const SizedBox(height: 20.0),

          // List of shoes
          Expanded(
            child: ListView.builder(
              itemCount: cart.getUserCart().length,
              itemBuilder: (context, index) {
                final shoe = cart.getUserCart()[index];
                return CartItem(shoe: shoe);
              },
            ),
          ),
        ]),
      ),
    );
  }
}
