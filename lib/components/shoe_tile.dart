import 'package:flutter/material.dart';
import '../models/shoe.dart';

class ShoeTile extends StatelessWidget {
  Shoe shoe;
  void Function()? onTap;

  ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25.0),
      width: 280.0,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Shoe picture
          ClipRRect(
            child: Image.asset(shoe.imageUrl),
            borderRadius: BorderRadius.circular(12.0),
          ),
          // Shoe description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              shoe.description,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          // Shoe price and details
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Shoe name
                    Text(
                      shoe.name,
                      style: Theme.of(context).textTheme.titleLarge,
                      ),
            
                    const SizedBox(height: 5.0),
                    // Shoe price
                    Text(
                      '\$' + shoe.price,
                      style: Theme.of(context).textTheme.titleSmall,),
                  ],
                ),
                // Add to cart button
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12)),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
