import 'package:flutter/material.dart';
import 'package:plants_app/core/app_colors.dart';
import 'package:plants_app/core/app_gradients.dart';
import 'package:plants_app/core/app_textstyles.dart';

class CheckoutScreen extends StatelessWidget{
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.cartBgGradient
        ),
        child: Padding(padding: .symmetric(horizontal: 24, vertical: 50), child: Column(
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
            // Expanded(child: ListView.separated(itemBuilder: (ctx, index) => , separatorBuilder: (ctx, index) => Divider(), itemCount: AppData.ca))
          ],
        ),),
      ),
    );
  }
}