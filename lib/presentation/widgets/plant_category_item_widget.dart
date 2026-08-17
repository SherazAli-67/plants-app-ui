import 'package:flutter/cupertino.dart';
import 'package:plants_app/core/app_colors.dart';
import 'package:plants_app/core/app_textstyles.dart';

class PlantCategoryItemWidget extends StatelessWidget{
  const PlantCategoryItemWidget({super.key, required this.category, required this.isSelected});

  final String category;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: .circular(60)
          ),
          padding: .all(8),
          alignment: .center,
          child: Container(
            alignment: .center,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primaryGreenColor : AppColors.whiteColor,
              borderRadius: .circular(60)
            ),
            padding: .symmetric(horizontal: 17, ),
            child: Text(category, textAlign: .center, style: AppTextStyles.mediumTextStyle.copyWith(color: isSelected ? AppColors.whiteColor : AppColors.primaryGreenColor, ),),
          ),
        ),
        Container(color: AppColors.whiteColor, height: 10,width: 8,),
      ],
    );
  }
}