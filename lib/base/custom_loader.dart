import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {

    // ignore: prefer_interpolation_to_compose_strings
    //print("I am printing loading state" + Get.find<AuthController>().isLoaded.toString());

    return Center(
      child: Container(
        height: Dimensions.height20*5,
        width: Dimensions.width20*5,
        alignment: Alignment.center,
      
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20*5/2),
          color: AppColors.mainColor,
        ),
      
        child: const CircularProgressIndicator(color: Colors.white,),
      ),
    );
  }
}