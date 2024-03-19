import 'package:food_delivery/pages/address/add_address_page.dart';
import 'package:food_delivery/pages/address/pick_address_map.dart';
import 'package:food_delivery/pages/auth/sign_in_page.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/pages/food/recommended_food_detail.dart';
import 'package:food_delivery/pages/home/home_page.dart';
import 'package:food_delivery/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splashPage = '/splash-page';
  static const String popularFood = '/popular-food';
  static const String recommendedFood= '/recommended-food';
  static const String cartPage = '/cart-page';
  static const String signIn = '/sign-in';
  static const String addAddress = '/add-address';
  static const String picAddressMap = '/pick-address';

  static String getInitial() => initial;
  static String getSplashPage() => splashPage;
  static String getPopularFood(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) => '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => cartPage;
  static String getSinginPage() => signIn;
  static String getAddressPage() => addAddress;
  static String getPickAddressPage() => picAddressMap;


  static List<GetPage> routes = [

    GetPage(name: initial, page: () => const HomePage(), transition: Transition.fade),

    GetPage(name: signIn, page: () => const SignInPage(), transition: Transition.fade),

    GetPage(name: splashPage, page: () => const SplashScreen()),

    GetPage(name: popularFood, page: () {
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return PopularFoodDetail(pageId: int.parse(pageId!), page : page!);
    },
    transition: Transition.downToUp,
    ),

    GetPage(name: recommendedFood, page: () {
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return RecommendedFoodDetail(pageId: int.parse(pageId!), page : page!);
    },
    transition: Transition.downToUp,
    ),

    GetPage(name: cartPage, page: () {
      return const CartPage();
    },
    transition: Transition.upToDown,
    ),

    GetPage(name: addAddress, page: () {
      return const AddAddressPage();
    },
    transition: Transition.fadeIn,
    ),

    GetPage(name: picAddressMap, page: () {
      PickAddressMap _pickAddress = Get.arguments;
      return _pickAddress;
    },
    transition: Transition.fadeIn,
    ),

  ];
}