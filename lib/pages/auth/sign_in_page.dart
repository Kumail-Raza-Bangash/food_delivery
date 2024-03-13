import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/auth/sign_up_page.dart';
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


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
        
            Container(
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
      ),
    );
  }
}