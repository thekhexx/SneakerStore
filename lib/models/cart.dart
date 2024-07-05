import 'package:flutter/material.dart';

import 'shoe.dart';
class Cart extends ChangeNotifier {
  // List of shoes
  List<Shoe> shoeShop = [
    Shoe(name: 'Air Force Low 1', imageUrl: 'lib/images/airforce.png', description: 'Awesome shoes for everyone', price: '110'),
    Shoe(name: 'Vapormax', imageUrl: 'lib/images/vapormax.png', description: 'Sport-ready shoes for everyone', price: '120'),
    Shoe(name: 'Dunk Low Retro', imageUrl: 'lib/images/dunklowretro.png', description: 'Stylish shoes for everyone', price: '130'),
    Shoe(name: 'P-6000', imageUrl: 'lib/images/p6000.png', description: 'Cool shoes for everyone', price: '90'),
    Shoe(name: 'Air TN Plus', imageUrl: 'lib/images/tnplus.png', description: 'Best shoes for everyone', price: '100'),
  ];

  // List in user cart
  List<Shoe> userCart = [];

  // Let list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // Get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // Add item to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // Remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}