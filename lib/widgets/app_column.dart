import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class AppColumn extends StatelessWidget {

  final String text;

  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
      
                  BigText(text: text, size: Dimensions.font26,),
      
                  SizedBox(height: Dimensions.height10,),
      
                  Row(
                    children: [
      
                      Wrap(
                        children: List.generate(5, (index) {
                          return const Icon(Icons.star, color: AppColors.mainColor, size: 15,);
                        }),
                      ),
      
                      const SizedBox(width: 10,),
      
                      SmallText(text: "4.5"),
      
                      const SizedBox(width: 10,),
      
                      SmallText(text: "123456"),
      
                      const SizedBox(width: 10,),
      
                      SmallText(text: "comments"),
      
                    ],
                  ),
      
                  SizedBox(height: Dimensions.height20,),
      
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndTextWidget(
                        icon: Icons.circle_sharp, 
                        text: "Normal", 
                        iconColor: AppColors.iconColor1,
                      ),
      
                      IconAndTextWidget(
                        icon: Icons.location_on, 
                        text: "1.7km", 
                        iconColor: AppColors.iconColor1,
                      ),
      
                      IconAndTextWidget(
                        icon: Icons.access_time_outlined, 
                        text: "32min", 
                        iconColor: AppColors.iconColor1,
                      ),
      
                    ],
                  )
                ],
              );
  }
}