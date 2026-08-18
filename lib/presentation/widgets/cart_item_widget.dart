import 'package:flutter/material.dart';
import 'package:plants_app/core/app_colors.dart';
import 'package:plants_app/core/app_textstyles.dart';
import 'package:plants_app/core/models/cart_item_model.dart';

class CartItemWidget extends StatelessWidget{
  const CartItemWidget({super.key, required this.cartItem});
  final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: .zero,
      leading: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          shape: .circle
        ),
        padding: .symmetric(vertical: 6.67, horizontal: 16),
        child: Image.asset(cartItem.product.image),
      ),
      title: Text(cartItem.product.title, style: AppTextStyles.subHeadingTextStyle.copyWith(fontSize: 20, fontWeight: .bold),),
      subtitle: Text('${cartItem.quantity} ${cartItem.quantity > 1 ?  'pieces' : 'piece'}', style: AppTextStyles.mediumTextStyle.copyWith(color: AppColors.primaryGreenColor),),
      trailing: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: .circular(99)
        ),
        padding: .symmetric(horizontal: 16.5, vertical: 10),
        child: Text('\$${cartItem.quantity * cartItem.product.price}', style: AppTextStyles.btnTextStyle.copyWith(fontSize: 16),),
      ),
    );
  }

}