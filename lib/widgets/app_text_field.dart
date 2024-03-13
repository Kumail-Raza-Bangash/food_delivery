import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  bool isObsecure;

  AppTextField({
    super.key,
    required this.textController,
    required this.hintText,
    required this.icon,
    this.isObsecure = false,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20,),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.radius15),
              boxShadow: [
                BoxShadow(
                blurRadius: 3,
                spreadRadius: 1,
                offset: const Offset(1, 3),
                color: Colors.grey.withOpacity(0.2),
              ),
              ]
            ),
            child: TextField(
              obscureText: isObsecure ? true : false,
              controller: textController,
              decoration: InputDecoration(

                hintText: hintText,

                prefixIcon: Icon(icon, color: AppColors.yellowColor,),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  borderSide: const BorderSide(
                    width: 1.0,
                    color: Colors.white,
                  ),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  borderSide: const BorderSide(
                    width: 1.0,
                    color: Colors.white,
                  ),
                ),

                border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                ),

               ),
            ),
          );
  }
}