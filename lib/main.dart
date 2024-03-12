import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/pages/auth/sign_up_page.dart';
import 'package:food_delivery/pages/splash/splash_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:food_delivery/helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Get.find<CartController>().getCartData();

    return  GetBuilder<CartController>(builder: (_){
      return GetBuilder<PopularProductController>(builder: (_){
        return GetBuilder<RecommendedProductController>(builder: (_){
          return const GetMaterialApp(
            title: 'Food Delivery',
            home: SignUpPage(),

            //home: SplashScreen(),
            //initialRoute: RouteHelper.getSplashPage(),
            //getPages: RouteHelper.routes,
          );
        });
      });
    });
  }
}
