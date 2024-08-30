import 'package:flutter/material.dart';

import 'shoe.dart';
class Cart extends ChangeNotifier {
  // List of shoes
  List<Shoe> shoeShop = [
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