import 'package:flutter/material.dart';
import '../models/shoe.dart';

class ShoeTile extends StatelessWidget {
  Shoe shoe;
  void Function()? onTap;

  ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shoe picture
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(shoe.imageUrl, width: 150, height: 150),
            ),
            // Shoe price and details
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Shoe price
                  Text(
                    '\$' + shoe.price,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
              
                  const SizedBox(height: 5.0),
                  // Shoe name
                  Text(
                    shoe.name,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            // Shoe description
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                shoe.brandName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Row(
              children: [
                // Add to cart button
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    width: 162,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
