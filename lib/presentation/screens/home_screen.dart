import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plants_app/constants/string_const.dart';
import 'package:plants_app/core/app_colors.dart';
import 'package:plants_app/core/app_data.dart';
import 'package:plants_app/core/app_gradients.dart';
import 'package:plants_app/core/app_icons.dart';
import 'package:plants_app/core/app_textstyles.dart';
import 'package:plants_app/presentation/widgets/plant_category_item_widget.dart';
import 'package:plants_app/presentation/widgets/swipeable_plant_item_card.dart';
import 'package:plants_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
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
                  itemBuilder: (_, index) => PlantCategoryItemWidget(categoryIndex: index,),itemCount: AppData.categories.length,),
            ),
            Padding(padding: .symmetric(horizontal: 24), child: Row(
              crossAxisAlignment: .center,
              mainAxisAlignment: .spaceBetween,
              children: [
                Text("Plant Collections", style: AppTextStyles.subHeadingTextStyle.copyWith(color: AppColors.primaryGreenColor),),
                SvgPicture.asset(AppIcons.icNext)
              ],
            ),),
            Expanded(child: SwipeablePlantCards()),
            Stack(
              alignment: .center,
              children: [
                Image.asset(AppIcons.cartRectangleShape, fit: .cover,),

                if( cartProvider.cartItems.isNotEmpty)
                  Padding(
                  padding: const .symmetric(horizontal: 24.0),
                  child:Row(
                    children: [
                      Row(
                        spacing: 16,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              shape: .circle
                            ),
                            padding: .symmetric(horizontal: 16, vertical: 8),
                            child: Text('${cartProvider.cartItems.length}', style: AppTextStyles.subHeadingTextStyle.copyWith(fontWeight: .bold),),
                          ),
                          Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text("Cart", style: AppTextStyles.subHeadingTextStyle.copyWith(fontSize: 20, fontWeight: .bold, color:AppColors.whiteColor),),
                              Text("${cartProvider.cartItems.length} items", style: AppTextStyles.mediumTextStyle.copyWith(color: Colors.white),)
                            ],
                          )
                        ],
                      ),
                      Expanded(
                        child: Stack(
                          alignment: .topRight,
                          children: List.generate(cartProvider.cartItems.length, (index){
                            String cartItem = cartProvider.cartItems[index].product.image;
                            return index == 0 ? _buildCartItemWidget(cartItem: cartItem) :  Positioned(
                              right: index * 30,
                              child: _buildCartItemWidget(cartItem: AppIcons.palmBlissPlant),);
                          })
                        ),
                      ),
                    ],
                  )
                )
              ],
            )
          ],
        ),
      )
    );
  }

  Widget _buildCartItemWidget({required String cartItem}) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          shape: .circle,
          border: .all(color: AppColors.primaryGreenColor, width: 5)
      ),
      padding: .symmetric(horizontal: 10, vertical: 4),
      child: Image.asset(cartItem, height: 40, width: 26,),
    );
  }

}