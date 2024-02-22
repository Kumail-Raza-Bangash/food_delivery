import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20*3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),

                SizedBox(width: Dimensions.width20*5,),

                AppIcon(
                  icon: Icons.home_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),

                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),

              ],
            )
          ),

          Positioned(
            top: Dimensions.height20*5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              //color: Colors.yellow,
              margin: EdgeInsets.only(top: Dimensions.width15),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (_, index){
                    return Container(
                      height: Dimensions.height20*5,
                      width: double.maxFinite,
                      margin: EdgeInsets.only(bottom: Dimensions.width10),
                
                      child: Row(
                        children: [
                          Container(
                            height: Dimensions.height20*5,
                            width: Dimensions.height20*5,
                            margin: EdgeInsets.only(right: Dimensions.width10/2),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/image/food0.png'
                                  )
                              ),
                              borderRadius: BorderRadius.circular(Dimensions.radius20)
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
              ),
            )
          ),


        ],
      ),
    );
  }
}