import 'package:flutter/material.dart';
import 'package:plants_app/core/models/plant_item_model.dart';
import '../core/models/cart_item_model.dart';

class CartProvider extends ChangeNotifier{
  List<CartItemModel> cartItems = [];

  List<String> get _cartItemPlantIds => cartItems.map((cartItem) => cartItem.product.id).toList();

  CartItemModel? _getCartItemByProductID(String id){
    for (var cartItem in cartItems) {
      if(cartItem.product.id == id){
        return cartItem;
      }
    }
    return null;
  }

  void addItemToCart(PlantItemModel plant){
    if(_cartItemPlantIds.contains(plant.id)){
      int index = cartItems.indexWhere((cartItem) => cartItem.product.id == plant.id);
      CartItemModel cartItem = cartItems[index];
      final updatedCartItem  = cartItem.copyWith(quantity: cartItem.quantity+1);
      cartItems[index] = updatedCartItem;
    }else{
      cartItems.add(CartItemModel(id: DateTime.now().toIso8601String(), product: plant, quantity: 1));
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

  void onDecreaseQuantityTap({required String plantID}){
    CartItemModel? cartItem = _getCartItemByProductID(plantID);
    if(cartItem != null){
      if(cartItem.quantity == 1){
        return;
      }
      int index = cartItems.indexWhere((item)=> item.id == cartItem.id);
      CartItemModel updatedCartItem = cartItem.copyWith(quantity: cartItem.quantity-1);
      cartItems[index] = updatedCartItem;
      notifyListeners();
    }
  }

  int getCartItemQuantityByPlanID(String id) {
    if(_cartItemPlantIds.contains(id)){
      CartItemModel cartItem = _getCartItemByProductID(id)!;
      return cartItem.quantity;
      // return cartItem.quantity < 10 ? '0${cartItem.quantity}' : cartItem.quantity.toString();
    }else{
      return 0;
    }
  }

  String getFormattedCartItemQuantityByPlanID(String id) {
    if(_cartItemPlantIds.contains(id)){
      CartItemModel cartItem = _getCartItemByProductID(id)!;
      return cartItem.quantity < 10 ? '0${cartItem.quantity}' : cartItem.quantity.toString();
    }else{
      return '00';
    }
  }
}