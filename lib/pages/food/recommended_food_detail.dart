import 'package:flutter/material.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(icon: Icons.arrow_back_ios)),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20), 
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10,),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  )
                ),
                child: Center(child: BigText(size: Dimensions.font26, text: "Chinese Side"),),
              )
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food0.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, right:  Dimensions.width20,),
                  child: const ExpandableTextWidget(
                    text: "Chicken meat is traditionally marinated prior to cooking to improve tenderness, flavor and increase shelf life. Marination is a process of infusing a solution of water, salt and other ingredients, such as phosphates and is done by injection or tumbling. Chicken meat is traditionally marinated prior to cooking to improve tenderness, flavor and increase shelf life. Marination is a process of infusing a solution of water, salt and other ingredients, such as phosphates and is done by injection or tumbling. Chicken meat is traditionally marinated prior to cooking to improve tenderness, flavor and increase shelf life. Marination is a process of infusing a solution of water, salt and other ingredients, such as phosphates and is done by injection or tumbling.Chicken meat is traditionally marinated prior to cooking to improve tenderness, flavor and increase shelf life. Marination is a process of infusing a solution of water, salt and other ingredients, such as phosphates and is done by injection or tumbling. Chicken meat is traditionally marinated prior to cooking to improve tenderness, flavor and increase shelf life. Marination is a process of infusing a solution of water, salt and other ingredients, such as phosphates and is done by injection or tumbling. Chicken meat is traditionally marinated prior to cooking to improve tenderness, flavor and increase shelf life. Marination is a process of infusing a solution of water, salt and other ingredients, such as phosphates and is done by injection or tumbling.Chicken meat is traditionally marinated prior to cooking to improve tenderness, flavor and increase shelf life. Marination is a process of infusing a solution of water, salt and other ingredients, such as phosphates and is done by injection or tumbling. Chicken meat is traditionally marinated prior to cooking to improve tenderness, flavor and increase shelf life. Marination is a process of infusing a solution of water, salt and other ingredients, such as phosphates and is done by injection or tumbling. Chicken meat is traditionally marinated prior to cooking to improve tenderness, flavor and increase shelf life. Marination is a process of infusing a solution of water, salt and other ingredients, such as phosphates and is done by injection or tumbling.Chicken meat is traditionally marinated prior to cooking to improve tenderness, flavor and increase shelf life. Marination is a process of infusing a solution of water, salt and other ingredients, such as phosphates and is done by injection or tumbling. Chicken meat is traditionally marinated prior to cooking to improve tenderness, flavor and increase shelf life. Marination is a process of infusing a solution of water, salt and other ingredients, such as phosphates and is done by injection or tumbling. Chicken meat is traditionally marinated prior to cooking to improve tenderness, flavor and increase shelf life. Marination is a process of infusing a solution of water, salt and other ingredients, such as phosphates and is done by injection or tumbling.",
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20*2.5,
              right: Dimensions.width20*2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconColor: Colors.white, 
                  backgroundColor: AppColors.mainColor, 
                  icon: Icons.remove,
                  iconSize: Dimensions.iconSize24,
                ),
                BigText(text: "\$12.88 " + " X " + " 0", color: AppColors.mainBlackColor, size: Dimensions.font26,),
                AppIcon(
                  iconColor: Colors.white, 
                  backgroundColor: AppColors.mainColor, 
                  icon: Icons.add,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),

          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(top: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20,),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20*2),
                topRight: Radius.circular(Dimensions.radius20*2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, right: Dimensions.width20, left: Dimensions.width20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                  ),
                ),
                
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, right: Dimensions.width20, left: Dimensions.width20),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                  ),
                  child: BigText(text: "\$10 | Add to cart", color: Colors.white,),
                ),
          
          ],
        ),
      ),

        ],
      )
    );
  }
}