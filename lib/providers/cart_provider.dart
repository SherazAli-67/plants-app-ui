import 'package:flutter/material.dart';
import '../core/models/cart_item_model.dart';

class CartProvider extends ChangeNotifier{
  List<CartItemModel> cartItems = [];

  List<String> get _cartItemPlantIds => cartItems.map((cartItem) => cartItem.product.id).toList();
  void addItemToCart(CartItemModel plant){
    if(_cartItemPlantIds.contains(plant.product.id)){
      int index = cartItems.indexWhere((cartItem) => cartItem.product.id == plant.product.id);
      CartItemModel cartItem = cartItems[index];
      final updatedCartItem  = cartItem.copyWith(quantity: cartItem.quantity+1);
      cartItems[index] = updatedCartItem;
    }else{
      cartItems.add(plant);
    }
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