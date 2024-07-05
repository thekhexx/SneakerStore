import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ShopBottomNavBar extends StatelessWidget {

  void Function(int)? onTabChange;

  ShopBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        gap: 8,
        color:Colors.grey[400],
        activeColor: Colors.grey.shade700,
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        tabBorderRadius: 16,
        onTabChange: (value) => onTabChange!(value),
        tabs: [
        GButton(
          icon: Icons.home_outlined, 
          text: 'Shop'),
        GButton(
          icon: Icons.shopping_bag_outlined, 
          text: 'Cart'),
      ]),
    );
  }
}
