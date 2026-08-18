import 'package:flutter/material.dart';
import 'package:plants_app/core/app_colors.dart';
import 'package:plants_app/core/app_gradients.dart';
import 'package:plants_app/core/app_icons.dart';
import 'package:plants_app/core/app_textstyles.dart';
import 'package:plants_app/presentation/widgets/cart_item_widget.dart';
import 'package:plants_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget{
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.cartBgGradient
        ),
        child: Padding(padding: .only(left: 24, right: 24, top: 50), child: Column(
          spacing: 22,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text("Cart", style: AppTextStyles.headingTextStyle.copyWith(fontWeight: .bold, color: AppColors.primaryGreenColor),),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.blueGreenColor,
                      shape: .circle
                  ),
                  padding: .symmetric(horizontal: 16, vertical: 8),
                  child: Text('4', style: AppTextStyles.subHeadingTextStyle.copyWith(fontWeight: .bold, color: Colors.white),),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: .circular(99)
              ),
              height: 4,
              width: 60,
            ),
            Expanded(child:
            ListView.separated(itemBuilder: (ctx, index) => CartItemWidget(cartItem: provider.cartItems[index]),
                separatorBuilder: (ctx, index) => Padding(
                  padding: const .symmetric(vertical: 8.0),
                  child: Divider(color: AppColors.dividerColor.withValues(alpha: 0.3),),
                ),
                itemCount: provider.cartItems.length)),
            Stack(
              children: [
                Image.asset(AppIcons.carScreenRectangleShape, fit: .cover,),
                Padding(padding: .symmetric(horizontal: 16, vertical: 57), child: Column(
                  spacing: 16,
                  children: [
                    _buildCheckoutRowItem(title: 'Delivery Amount', amount: '\$25.50'),
                    Divider(color: AppColors.whiteColor.withValues(alpha: 0.3),),
                    _buildCheckoutRowItem(title: 'Total Amount', amount: provider.getTotalPrice()),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.whiteColor,
                          padding: .only(left: 21, right: 8, top: 6, bottom: 6)
                        ),
                        onPressed: (){}, child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text("Make Payment", style: AppTextStyles.btnTextStyle.copyWith(color: AppColors.primaryGreenColor),),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: .circular(99),
                            color: AppColors.primaryGreenColor
                          ),
                          padding: .symmetric(vertical: 8, horizontal: 15),
                          child: Row(
                            spacing: 8,
                            children: [
                              Icon(Icons.navigate_next_rounded, color: AppColors.whiteColor.withValues(alpha: 0.3), size: 32,),
                              Icon(Icons.navigate_next_rounded, color: AppColors.whiteColor.withValues(alpha: 0.7), size: 32,),
                              Icon(Icons.navigate_next_rounded, color: AppColors.whiteColor, size: 32,)
                            ],
                          ),
                        )
                      ],
                    ))
                  ],
                ),)
              ],
            )
          ],
        ),),
      ),
    );
  }

  Widget _buildCheckoutRowItem({required String title, required String amount}) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(title, style: AppTextStyles.mediumTextStyle.copyWith(
            fontSize: 16, color: AppColors.whiteColor),),
        Text(amount, style: AppTextStyles.btnTextStyle.copyWith(
            fontSize: 20, color: AppColors.whiteColor),),
      ],
    );
  }
}