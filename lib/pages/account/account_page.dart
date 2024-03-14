// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/user_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/account_widget.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {

    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(_userLoggedIn){
      Get.find<UserController>().getUserInfo();
      //print("User has logged in");

    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Center(
          child: BigText(
            text: "Profile", size: 24, color: Colors.white,
          ),
        ),
      ),

      body: GetBuilder<UserController>(builder: (userController){
        return _userLoggedIn ? (userController.isLoading ? Container(

        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),

        child: Column(
          children: [
            //profile icons
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.height15*5,
              size: Dimensions.height15*10,
            ),
            SizedBox(height: Dimensions.height30,),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //name
                    AccountWidget(
                  appIcon: AppIcon(
                    icon: Icons.person,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.height10*5/2,
                    size: Dimensions.height10*5,
                  ), 
                  bigText: BigText(
                    text: userController.userModel.name,
                  ),
                ),
                    SizedBox(height: Dimensions.height20,),
                    //phone
                    AccountWidget(
                  appIcon: AppIcon(
                    icon: Icons.phone,
                    backgroundColor: AppColors.yellowColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.height10*5/2,
                    size: Dimensions.height10*5,
                  ), 
                  bigText: BigText(
                    text: userController.userModel.phone,
                  ),
                ),
                    SizedBox(height: Dimensions.height20,),
                    //email
                    AccountWidget(
                  appIcon: AppIcon(
                    icon: Icons.email,
                    backgroundColor: AppColors.yellowColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.height10*5/2,
                    size: Dimensions.height10*5,
                  ), 
                  bigText: BigText(
                    text: userController.userModel.email,
                  ),
                ),
                    SizedBox(height: Dimensions.height20,),
                    //address
                    AccountWidget(
                  appIcon: AppIcon(
                    icon: Icons.location_on,
                    backgroundColor: AppColors.yellowColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.height10*5/2,
                    size: Dimensions.height10*5,
                  ), 
                  bigText: BigText(
                    text: "Filled in your address"
                  ),
                ),
                    SizedBox(height: Dimensions.height20,),
                    //meassage
                    AccountWidget(
                  appIcon: AppIcon(
                    icon: Icons.message_outlined,
                    backgroundColor: Colors.redAccent,
                    iconColor: Colors.white,
                    iconSize: Dimensions.height10*5/2,
                    size: Dimensions.height10*5,
                  ), 
                  bigText: BigText(
                    text: "Message"
                  ),
                ),
                    SizedBox(height: Dimensions.height20,),

                    GestureDetector(
                      onTap: (){
                        if(Get.find<AuthController>().userLoggedIn()){
                          Get.find<AuthController>().clearSharedData();
                          Get.find<CartController>().clear();
                          Get.find<CartController>().clearCartHistory();

                          Get.offNamed(RouteHelper.getSinginPage());
                        }
                        else{
                          print("you logged out");
                        }
                      },
                      child: AccountWidget(
                                        appIcon: AppIcon(
                      icon: Icons.logout,
                      backgroundColor: Colors.redAccent,
                      iconColor: Colors.white,
                      iconSize: Dimensions.height10*5/2,
                      size: Dimensions.height10*5,
                                        ), 
                                        bigText: BigText(
                      text: "Logout"
                                        ),
                                      ),
                    ),
                    SizedBox(height: Dimensions.height20,),
                          
                  ],
                ),
              ),
            )
          ],
        ),
      )
      :
      const CustomLoader()
      ) 
      :
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
          width: double.maxFinite,
          height:  Dimensions.height20*8,
          margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius20),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/image/signintocontinue.png"),
            ),
          )
      ),

      SizedBox(height: Dimensions.height20*3,),

      GestureDetector(
        onTap: (){
          Get.toNamed(RouteHelper.getSinginPage());
        },
        child: Container(
            width: Dimensions.width20*10,
            height:  Dimensions.height10*5,
            margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
            decoration:  BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(Dimensions.radius20),
            ),
        
            child: Center(child: BigText(text: "Signin", color: Colors.white, size: Dimensions.font26,)),
        ),
      ),

          ],
        )
      );

      }),
    );
  }
}