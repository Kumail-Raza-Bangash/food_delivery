// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/pages/home/food_page_body.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {

    Future<void> _loadResourse() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }
  
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.mainColor,
      child: Column(
        children: [
          //header 
          Container(
            margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
            padding: EdgeInsets.only(right: Dimensions.width20, left: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "Pakistan", color: AppColors.mainColor,),
                    Row(
                      children: [
                        SmallText(text: "Punjab", color: Colors.black45,),
                        const Icon(Icons.arrow_drop_down_rounded)
                      ],
                    )
                  ],
                ),
                Center(
                  child: Container(
                    width: Dimensions.width45,
                    height: Dimensions.height45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: AppColors.mainColor,
                    ),
                    child: Icon(Icons.search, color: Colors.white, size: Dimensions.iconSize24,),
                  ),
                ),
              ],
            ),
          ),

          // body
          const Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          ),
          
        ],
      ),
    
    onRefresh: _loadResourse,
  );
  }
}