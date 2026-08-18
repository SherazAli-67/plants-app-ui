import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plants_app/core/app_colors.dart';
import 'package:plants_app/core/app_icons.dart';
import 'package:plants_app/core/app_textstyles.dart';
import 'package:plants_app/core/models/cart_item_model.dart';
import 'package:plants_app/core/models/plant_item_model.dart';
import 'package:plants_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class PlantCard extends StatelessWidget {
  final PlantItemModel plant;
  const PlantCard({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const .symmetric(vertical: 12),
      padding: const .all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: .circular(40),
      ),
      child: Column(
        spacing: 18,
        children: [
          Expanded(
            child: Container(
              width: .infinity,
              decoration: BoxDecoration(
                color: AppColors.greyBgColor,
                borderRadius: .circular(28),
              ),
              child: Hero(
                  tag: plant.id,
                  child: Image.asset(plant.image, fit: BoxFit.contain,)),
            ),
          ),
          Column(
            spacing: 7,
            children: [
              Text(
                plant.title,
                style: AppTextStyles.subHeadingTextStyle.copyWith(color: AppColors.primaryGreenColor, fontWeight: .w700,),
                textAlign: TextAlign.center,
              ),
              Text(
                plant.description,
                style: AppTextStyles.mediumTextStyle.copyWith(color: AppColors.greyColor, fontWeight: .w400, height: 1.4,),
                textAlign: .center,
                maxLines: 2,
                overflow: .ellipsis,
              ),
            ],
          ),
          GestureDetector(
            onTap: () => onAddToCartTap(context),
            child: Container(
              width: .infinity,
              padding: const .symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.primaryGreenColor,
                borderRadius: .circular(40),
              ),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      SvgPicture.asset(AppIcons.icDelete),
                      Text('Add to Cart', style: AppTextStyles.mediumTextStyle.copyWith(color: AppColors.whiteColor, fontWeight: .w600,),),
                    ],
                  ),
                  Text('\$${plant.price.toStringAsFixed(2)}', style: AppTextStyles.mediumTextStyle.copyWith(color: AppColors.whiteColor, fontWeight: .w700,),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  void onAddToCartTap(BuildContext context){
    final provider = Provider.of<CartProvider>(context, listen: false);
    provider.addItemToCart(CartItemModel(id: DateTime.now().toIso8601String(), product: plant, quantity: 1));
  }
}
