import 'package:flutter/material.dart';
import 'package:plants_app/core/app_colors.dart';
import 'package:plants_app/core/app_textstyles.dart';
import 'package:plants_app/core/models/plant_item_model.dart';

class PlantCard extends StatelessWidget {
  final PlantItemModel plant;
  const PlantCard({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.greyBgColor,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Image.asset(
                plant.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            plant.title,
            style: AppTextStyles.subHeadingTextStyle.copyWith(
              color: AppColors.primaryGreenColor,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            plant.description,
            style: AppTextStyles.mediumTextStyle.copyWith(
              color: AppColors.greyColor,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.primaryGreenColor,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.shopping_basket_outlined,
                        color: AppColors.whiteColor,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Add to Cart',
                        style: AppTextStyles.mediumTextStyle.copyWith(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '\$${plant.price.toStringAsFixed(2)}',
                    style: AppTextStyles.mediumTextStyle.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
