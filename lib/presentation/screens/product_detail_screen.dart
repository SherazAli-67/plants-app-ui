import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:plants_app/core/app_icons.dart';
import 'package:plants_app/core/models/plant_item_model.dart';
import 'package:plants_app/router/app_router.dart';
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
            Padding(
              padding: const EdgeInsets.only(bottom:140.0),
              child: Image.asset(plant.image,),
            ),
            Positioned(
              bottom: 100,
              right: 0,
              left: 0,
              child: Column(
                mainAxisAlignment: .center,
                children: [

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
              ),
            ),
            Positioned(
                bottom: 32,
                left: 24,
                right: 24,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryGreenColor,elevation: 0, padding: .only(right: 24)),
                    onPressed: ()=> context.push(NamedRoutes.cart.routeName), child: Row(
                  spacing: 12,
              children: [
                Container(
                  margin: .all(8),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    shape: .circle
                  ),
                  padding: .all(16),
                  child: SvgPicture.asset(AppIcons.icDelete, colorFilter: .mode(Colors.black, .srcIn),),
                ),
                Text("Add to Cart", style: AppTextStyles.btnTextStyle.copyWith(color: AppColors.whiteColor),),
                const Spacer(),
                Text("\$${50.0}", style: AppTextStyles.btnTextStyle.copyWith(color: AppColors.whiteColor),)
              ],
            )))
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
