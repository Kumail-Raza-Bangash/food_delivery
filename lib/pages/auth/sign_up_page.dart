import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
          ),

          SizedBox(height: Dimensions.height20,),

          //your name
          AppTextField(
            textController: nameController, 
            hintText: "Name", 
            icon: Icons.person,
          ),

          SizedBox(height: Dimensions.height20,),

          //your phone
          AppTextField(
            textController: phoneController, 
            hintText: "Phone", 
            icon: Icons.phone,
          ),

          SizedBox(height: Dimensions.height20,),

          
        ],
      ),
    );
  }
}