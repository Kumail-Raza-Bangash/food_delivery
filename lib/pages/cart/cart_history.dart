import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {

    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();

      Map<String, int> cartItemsPerOrder = Map();
      
      for(int i=0; i<getCartHistoryList.length; i++){
        if(cartItemsPerOrder.containsKey(getCartHistoryList[i].time)){
          cartItemsPerOrder.update(getCartHistoryList[i].time!, (value) => ++value);
        }
        else {
          cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
        }
      }
      
      List<int> cartOrderTimeToList(){
        return cartItemsPerOrder.entries.map((e) => e.value).toList();
      }
      
      List<int> orderTimes = cartOrderTimeToList();
      
      var saveCounter = 0;  
  

    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColors.mainColor,
            height: Dimensions.height20*5, //100
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimensions.height45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: "Cart History", color: Colors.white,),
                const AppIcon(icon: Icons.shopping_cart_outlined, iconColor: AppColors.mainColor,)
              ],
            ),
          )
        ],
      ),
    );
  }
}