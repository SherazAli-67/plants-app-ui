import 'package:flutter/material.dart';
import '../core/models/cart_item_model.dart';

class CartProvider extends ChangeNotifier{
  List<CartItemModel> cartItems = [];


  void addItemToCart(CartItemModel plant){
    cartItems.add(plant);
    notifyListeners();
  }

  String getTotalPrice(){
   double total = 0;
   for (var item in cartItems) {
     total += item.quantity * item.product.price;
   }
   return '\$${total.toStringAsFixed(2)}';
  }

  void onIncreaseQuantityTap({required CartItemModel cartItem}){
    int index = cartItems.indexWhere((item)=> item.id == cartItem.id);
    CartItemModel updatedCartItem = cartItem.copyWith(quantity: cartItem.quantity+1);
    cartItems[index] = updatedCartItem;
    notifyListeners();
  }

  void onDecreaseQuantityTap({required CartItemModel cartItem}){
    if(cartItem.quantity == 1){
      return;
    }
    int index = cartItems.indexWhere((item)=> item.id == cartItem.id);
    CartItemModel updatedCartItem = cartItem.copyWith(quantity: cartItem.quantity-1);
    cartItems[index] = updatedCartItem;
    notifyListeners();
  }
}