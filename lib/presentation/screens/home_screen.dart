import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plants_app/constants/string_const.dart';
import 'package:plants_app/core/app_colors.dart';
import 'package:plants_app/core/app_data.dart';
import 'package:plants_app/core/app_gradients.dart';
import 'package:plants_app/core/app_icons.dart';
import 'package:plants_app/core/app_textstyles.dart';
import 'package:plants_app/presentation/widgets/plant_category_item_widget.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: AppGradients.primaryBgGradient
        ),
        child: Column(
          spacing: 32,
          children: [
            Padding(
              padding: .only(left: 24, right: 24, top: 40),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(text: TextSpan(
                      text: "Let's Make our lives ",
                      style: AppTextStyles.headingTextStyle.copyWith(
                        color: AppColors.primaryGreenColor,
                        fontFamily: StringConst.appFontFamily
                      ),
                      children: [
                        TextSpan(
                          text: "Greener",
                          style: AppTextStyles.headingTextStyle.copyWith(
                              color: AppColors.primaryGreenColor,
                              fontFamily: StringConst.appFontFamily,
                            fontWeight: .bold
                          ),
                        )
                      ]
                    )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: .circular(12),
                      border: .all(color: AppColors.primaryGreenColor)
                    ),
                    padding: .symmetric(horizontal: 8, vertical: 20),
                    child: Icon(Icons.menu, color: AppColors.primaryGreenColor,),
                  )
                ],
              ),
            ),
            Container(
              height: 46,
              margin: .only(left: 24),
              child: ListView.builder(
                  scrollDirection: .horizontal,
                  itemBuilder: (_, index) => PlantCategoryItemWidget(category: AppData.categories[index], isSelected: index == 0),itemCount: AppData.categories.length),
            ),
            Padding(padding: .symmetric(horizontal: 24), child: Row(
              crossAxisAlignment: .center,
              mainAxisAlignment: .spaceBetween,
              children: [
                Text("Plant Collections", style: AppTextStyles.subHeadingTextStyle.copyWith(color: AppColors.primaryGreenColor),),
                SvgPicture.asset(AppIcons.icNext)
              ],
            ),),
            Padding(padding: .only(top: 40), child: Column(),)
          ],
        ),
      )
    );
  }


}