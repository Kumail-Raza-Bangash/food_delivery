
import 'package:get/get.dart';

class Dimensions {
   static double screenHieght = Get.context!.height; //My OPPO f17 height is 925
   static double screenWidth = Get.context!.width;

   static double pageView = screenHieght / 2.89; // 925/320
   static double pageViewContainer = screenHieght / 4.20; // 925/220
   static double pageViewTextContainer = screenHieght / 7.70; // 925/120

  //dynamic height for passing and margin
   static double height10 = screenHieght / 92.5; 
   static double height15 = screenHieght / 61.66;
   static double height20 = screenHieght / 46.25;
   static double height30 = screenHieght / 30.83;
   static double height45 = screenHieght / 20.55;

   //dynamic width for passing and margin
   static double width10 = screenHieght / 92.5;
   static double width15 = screenHieght / 61.66;
   static double width20 = screenHieght / 46.25;
   static double width30 = screenHieght / 30.83;
   static double width45 = screenHieght / 20.55;

   static double font20 = screenHieght / 46.25;

   static double radius15 = screenHieght / 61.66;
   static double radius20 = screenHieght / 46.25;
   static double radius30 = screenHieght / 30.83;

   static double iconSize24 = screenHieght / 38.54;
}