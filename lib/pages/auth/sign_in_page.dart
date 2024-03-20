// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers, unnecessary_string_escapes

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/base/show_custom_snackbar.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/pages/auth/sign_up_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    void _login(AuthController authController) {

      var authController = Get.find<AuthController>();
      
      String email = emailController.text.trim(); 
      String password= passwordController.text.trim(); 

      if (email.isEmpty){
        showCustomSnackBar("Type in your email", title: "Email Address");
      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar("Type in a valid email address", title: "Valid Email Address");
      }else if(password.isEmpty){
        showCustomSnackBar("Type in your password", title: "Password");
      }else if(password.length < 6){
        showCustomSnackBar("Password could not be less than 6 characters", title: "Password");
      }else {
        showCustomSnackBar("Login Successfully", title: "Login");
        
          authController.login(email, password).then((status) {
            if(status.isSuccess){
              Get.toNamed(RouteHelper.getInitial());
              //Get.toNamed(RouteHelper.getCartPage());
            }else{
              showCustomSnackBar(status.message);
            }
          });
      }
    }



    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController){
        return !authController.isLoaded ? SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: Dimensions.screenHieght*0.05,),
            
            //app logo
            Container(
              height:  Dimensions.screenHieght*0.25,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: Dimensions.radius20*4,
                  backgroundImage: const AssetImage(
                    "assets/image/logo part 1.png"
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: Dimensions.width20),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                      fontSize: Dimensions.font20*3+Dimensions.font20/2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Sign into your account",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      color: Colors.grey[500],
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: Dimensions.height20,),
        
            //your email
            AppTextField(
              textController: emailController, 
              hintText: "Email", 
              icon: Icons.email,
            ),
        
            SizedBox(height: Dimensions.height20,),
        
            //your password
            AppTextField(
              textController: passwordController, 
              hintText: "Password", 
              icon: Icons.password_sharp,
              isObsecure: true,
            ),

            SizedBox(height: Dimensions.height20,),

            Row(
              children: [
                Expanded(child: Container()),

                RichText(
                  text: TextSpan(
                    text: "Sigin to your account",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font20,
                    )
                  )
                ),

                SizedBox(width: Dimensions.width20,),
              ],
            ),
        
            SizedBox(height: Dimensions.screenHieght*0.05,),
        
            GestureDetector(
              onTap: (){
                _login(authController);
              },
              child: Container(
                width: Dimensions.screenWidth/2,
                height: Dimensions.screenHieght/15,
                      
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.mainColor
                ),
                child: Center(
                  child: BigText(
                    text: "Sign in",
                    size: Dimensions.font20+Dimensions.font20/2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        
            SizedBox(height: Dimensions.screenHieght*0.05,),
        
            RichText(
              text: TextSpan(
                text: "Don\'t have an account? ",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: Dimensions.font20,
                ),
                children: [
                  TextSpan(
                    recognizer:  TapGestureRecognizer()..onTap=()=>Get.to(() => SignUpPage(), transition: Transition.fade),
                    text: "Create",
                    style: TextStyle(
                      color: AppColors.mainBlackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.font20,
                    ),
                  ),
                ]
              ),
            ),
        
        
            
          ],
        ),
      )
      :
      const CustomLoader();
      }),
    );
  }
}