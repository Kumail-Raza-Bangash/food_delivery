import 'dart:convert';

import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {

  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  
  void addToCartList(List<CartModel> cartList){
    
    cart = [];

    //converting object to String because SharePreferences accepts only String 

    cartList.forEach((element) => cart.add(jsonEncode(element)));

    sharedPreferences.setStringList(AppConstant.CART_LIST, cart);
    //print(sharedPreferences.getStringList(AppConstant.CART_LIST));
    getCartList();
  }

  List<CartModel> getCartList(){
    List<String> carts = [];

    if(sharedPreferences.containsKey(AppConstant.CART_LIST)){
      carts = sharedPreferences.getStringList(AppConstant.CART_LIST)!;
      print("Inside getCartList" + carts.toString());
    }

    List<CartModel> cartList = [];

    carts.forEach((element) => CartModel.fromJson(jsonDecode(element)));

    return cartList;
  }
  
}