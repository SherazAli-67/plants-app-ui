import 'package:flutter/cupertino.dart';
import 'package:plants_app/core/app_colors.dart';
import 'package:plants_app/core/app_data.dart';
import 'package:plants_app/core/app_textstyles.dart';
import 'package:plants_app/providers/home_provider.dart';
import 'package:provider/provider.dart';

class PlantCategoryItemWidget extends StatelessWidget{
  const PlantCategoryItemWidget({super.key,  required this.categoryIndex});

  final int categoryIndex;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    String category = AppData.categories[categoryIndex];
    final isSelected = provider.selectedTabIndex == categoryIndex;
    return GestureDetector(
      onTap: ()=> provider.onTabTap(categoryIndex),
      child: Row(
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
      ),
    );
  }
}