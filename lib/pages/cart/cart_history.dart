import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/utils/app_constants.dart';
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
      
      List<int> itemsPerOrder = cartOrderTimeToList();
      
      var listCounter = 0;  
  

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
          ),

          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
            
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView(
                  children: [
                    for(int i=0; i<itemsPerOrder.length; i++)
                      Container(
                        margin: EdgeInsets.only(bottom: Dimensions.height20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: "Time"),
                            SizedBox(height: Dimensions.height10,),
                            Row(
                              children: [
                                Wrap(
                                  direction: Axis.horizontal,
                                  children: List.generate(itemsPerOrder[i], (index) {
                                    if(listCounter<getCartHistoryList.length){
                                      listCounter++;
                                    }
                                    return index <= 2 ? 
                                    Container(
                                      height: Dimensions.height20*4,
                                      width: Dimensions.width20*4,
                                      margin: EdgeInsets.only(right: Dimensions.width10/2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.radius15/2),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            AppConstant.BASE_URL+AppConstant.UPLOAD_URL+getCartHistoryList[listCounter-1].img!,
                                          ),
                                        ),
                                      ),
                                    )
                                    :
                                    Container();
                                  }),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    
                  ],
                  
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}