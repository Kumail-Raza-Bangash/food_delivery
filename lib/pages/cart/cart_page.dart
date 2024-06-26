// ignore_for_file: prefer_is_empty, prefer_const_constructors, no_leading_underscores_for_local_identifiers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:food_delivery/base/no_data_page.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/location_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

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

                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
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

          GetBuilder<CartController>(
            builder: (_cartController){
              return _cartController.getItems.length>0
              ?
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
            
                  child: GetBuilder<CartController>(builder:(cartController) {
                    var _cartList = cartController.getItems;
                    return ListView.builder(
                      itemCount: _cartList.length,
                      itemBuilder: (_, index){
                        return Container(
                          height: Dimensions.height20*5,
                          width: double.maxFinite,
                          margin: EdgeInsets.only(bottom: Dimensions.width10),
                    
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  var popularIndex = Get.find<PopularProductController>().
                                  popularProductList.indexOf(_cartList[index].product!);
            
                                  if(popularIndex>=0){
                                    Get.toNamed(RouteHelper.getPopularFood(popularIndex, "cart-page"));
                                  }
                                  else {
                                    var recommendedIndex = Get.find<RecommendedProductController>().
                                    recommendedProductList.indexOf(_cartList[index].product!);
                                    if(recommendedIndex < 0){
                                      Get.snackbar("History Product", "Product review is not available for history product",
                                      backgroundColor: AppColors.mainColor,
                                      colorText: Colors.white,
                    );
                                    }
                                    else {
                                      Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex, "cart-page"));
                                    }
                                  }
                                },
                                child: Container(
                                  height: Dimensions.height20*5,
                                  width: Dimensions.height20*5,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        AppConstant.BASE_URL+AppConstant.UPLOAD_URL+cartController.getItems[index].img!,
                                      )
                                    ),
                                    borderRadius: BorderRadius.circular(Dimensions.radius20)
                                  ),
                                ),
                              ),
                    
                              SizedBox(width: Dimensions.width10,),
                    
                              Expanded(
                                child: Container(
                                  height: Dimensions.height20*5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(
                                        text:  cartController.getItems[index].name!,
                                        color: Colors.black54,
                                      ),
                    
                                      SmallText(text: "spicy"),
                    
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                            text: cartController.getItems[index].price!.toString(),
                                            color: Colors.redAccent,
                                          ),
                    
                                          Container(
                                            padding: EdgeInsets.only(top: Dimensions.height10, bottom: Dimensions.height10, right: Dimensions.width10, left: Dimensions.width10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                                            ),
                                            
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: (){
                                                    cartController.addItem(_cartList[index].product!, -1);
                                                  },
                                                  child: const Icon(Icons.remove, color: AppColors.signColor,),
                                                ),
                                                
                                                 SizedBox(width: Dimensions.width10/2,),
                                                 
                                                 BigText(text: _cartList[index].quantity.toString()),//popularProduct.inCartItems.toString()),
                                                 
                                                 SizedBox(width: Dimensions.width10/2,),
                                                 
                                                 GestureDetector(
                                                  onTap: (){
                                                    cartController.addItem(_cartList[index].product!, 1);
                                                  },
                                                  child: const Icon(Icons.add, color: AppColors.signColor,)
                                                ),
                                              ],
                                            ),
                                          ),
                    
                                        ],
                                      ),
                    
                                    ],
                                  ),
                                ),
                              ),
                    
                    
                            ],
                          ),
                        );
                      });
                  },
                    
                  ),
                ),
              )
            )
          :
          NoDataPage(text: "Your Cart is empty!");
            }
           ),


        ],
      ),

      bottomNavigationBar: GetBuilder<CartController>(builder: (cartController){
        return Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20,),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2),
          )
        ),
        child: cartController.getItems.length > 0 ?
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, right: Dimensions.width20, left: Dimensions.width20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Row(
                children: [
                  
                  SizedBox(width: Dimensions.width10/2,),
                  BigText(
                    text: '\$${cartController.totalAmount.toString()}', 
                    //color: Colors.redAccent,
                  ),
                  SizedBox(width: Dimensions.width10/2,),
                  
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                if(Get.find<AuthController>().userLoggedIn()){
                  //cartController.addToHistory();
                  if(Get.find<LocationController>().addressList.isEmpty){
                    Get.toNamed(RouteHelper.getAddressPage());
                  }
                  else{
                    Get.offNamed(RouteHelper.getInitial());
                  }
                }
                else{
                  Get.toNamed(RouteHelper.getSinginPage());
                }
                //popularProduct.addItem(product);
                
              },
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, right: Dimensions.width20, left: Dimensions.width20),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
              
                child: BigText(text: "Check out", color: Colors.white,),
              ),
            ),
          
          ],
        )
        :
        Container(),
      );
      })
    

    );
  }
}