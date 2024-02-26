
import 'package:get/get.dart';

class Dimensions {
   static double screenHieght = Get.context!.height; //My OPPO f17 height is 925
   static double screenWidth = Get.context!.width; //My OPPO f17 width is 421

   static double pageView = screenHieght / 2.89; // 925/320
   static double pageViewContainer = screenHieght / 4.20; // 925/220
   static double pageViewTextContainer = screenHieght / 7.70; // 925/120

  //dynamic height for passing and margin
   static double height10 = screenHieght / 92.5; // 925/10
   static double height15 = screenHieght / 61.66; // 925/15
   static double height20 = screenHieght / 46.25; // 925/20
   static double height30 = screenHieght / 30.83; // 925/30
   static double height45 = screenHieght / 20.55; // 925/45

   //dynamic width for passing and margin
   static double width10 = screenHieght / 92.5; // 925/10
   static double width15 = screenHieght / 61.66; // 925/15
   static double width20 = screenHieght / 46.25; // 925/20
   static double width30 = screenHieght / 30.83; // 925/30
   static double width45 = screenHieght / 20.55; // 925/45

  // font size
   static double font16 = screenHieght / 57.81; // 925/16
   static double font20 = screenHieght / 46.25; // 925/20
   static double font26 = screenHieght / 35.57; // 925/26

   static double radius15 = screenHieght / 61.66; // 925/15
   static double radius20 = screenHieght / 46.25; // 925/20
   static double radius30 = screenHieght / 30.83; // 925/30

   //icons Sizes
   static double iconSize24 = screenHieght / 38.54; // 925/24
   static double iconSize16 = screenHieght / 57.81; // 925/16
 
   //list view size
   static double listViewImgSize = screenWidth / 3.51; // 421/120
   static double listViewTextCountSize = screenWidth / 4.21; // 421/100

   //popular food detail
    static double popularFoodImgSize = screenHieght / 2.64; // 925/350

    //bottom height 
    static double bottomHeightBar = screenHieght / 7.70; // 925/120

    // Splash Screen image
    static double splashImg = screenHieght / 3.70; // 925/250
}