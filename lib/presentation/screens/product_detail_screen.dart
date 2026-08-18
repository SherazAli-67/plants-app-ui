import 'package:flutter/material.dart';
import 'package:plants_app/core/app_icons.dart';
import 'package:plants_app/core/models/plant_item_model.dart';
import '../../constants/string_const.dart';
import '../../core/app_colors.dart';
import '../../core/app_gradients.dart';
import '../../core/app_textstyles.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.plant});
  final PlantItemModel plant;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.primaryBgGradient),
        child: Stack(
          alignment: .center,
          children: [
            Center(
              child:FittedBox(child: Text("Plants", style: AppTextStyles.headingTextStyle.copyWith(fontSize: 160, fontWeight: .bold, color: AppColors.whiteColor.withValues(alpha: 0.2), ),)),
            ),
            Column(
              children: [
                Padding(
                  padding: .only(left: 24, right: 24, top: 40),
                  child: Row(
                    children: [
                      Expanded(
                        child: RichText(text: TextSpan(
                            text: '$plantTitleHeadingText\n',
                            style: AppTextStyles.headingTextStyle.copyWith(
                                color: AppColors.primaryGreenColor,
                                fontFamily: StringConst.appFontFamily
                            ),
                            children: [
                              TextSpan(
                                text: plantTitleSubHeadingText,
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
              ],
            ),
            Column(
              mainAxisAlignment: .center,
              children: [
                Image.asset(plant.image, fit: .cover,),
                Row(
                  children: [
                    Stack(
                      alignment: .center,
                      children: [
                        Image.asset(AppIcons.mountainShapedVectorLeftSide),
                        IconButton(onPressed: (){}, icon: Icon(Icons.remove, color: Colors.white, size: 40,))
                      ],
                    ),
                    Expanded(child: Column(
                      children: [
                        Text(plant.description,textAlign: .center, style: AppTextStyles.mediumTextStyle.copyWith(fontSize: 16, fontStyle: .italic, color: AppColors.whiteColor, fontWeight: .w400),),
                        Text('02', style: AppTextStyles.headingTextStyle.copyWith(fontSize: 60, fontWeight: .bold, color: Colors.white),)
                      ],
                    )),
                    Stack(
                      alignment: .center,
                      children: [
                        Image.asset(AppIcons.mountainShapedVectorRightSide),
                        IconButton(onPressed: (){}, icon: Icon(Icons.add_rounded, color: Colors.white, size: 40,))
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  String get plantTitleHeadingText {
    List<String> titleSections = plant.title.split(' ');
    String headingText = '';
    for(int i=0;i< titleSections.length-1; i++){
      headingText += '${titleSections[i]} ';
    }
    return headingText;
  }

  String get plantTitleSubHeadingText {
    return  plant.title.split(' ').last;
  }
}
