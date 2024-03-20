// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {

  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];
  
  void addToCartList(List<CartModel> cartList){

    //sharedPreferences.remove(AppConstant.CART_LIST);
    //sharedPreferences.remove(AppConstant.CART_HISTORY_LIST);
    //return;

    var time = DateTime.now().toString();
    cart = [];

    //converting object to String because SharePreferences accepts only String 

    cartList.forEach((element) {
      element.time = time;
      return cart.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(AppConstant.CART_LIST, cart);
    //print(sharedPreferences.getStringList(AppConstant.CART_LIST));
    // getCartList();
  }

  List<CartModel> getCartList(){
    List<String> carts = [];

    if(sharedPreferences.containsKey(AppConstant.CART_LIST)){
      carts = sharedPreferences.getStringList(AppConstant.CART_LIST)!;
      print("Inside getCartList" + carts.toString());
    }

    List<CartModel> cartList = [];

    carts.forEach((element) => cartList.add(CartModel.fromJson(jsonDecode(element))));

    return cartList;
  }

  List<CartModel> getCartHistoryList(){
    if(sharedPreferences.containsKey(AppConstant.CART_HISTORY_LIST)){
      cartHistory = [];
      cartHistory = sharedPreferences.getStringList(AppConstant.CART_HISTORY_LIST)!;
    }

    List<CartModel> cartListHistory = [];

    cartHistory.forEach((element) => cartListHistory.add(CartModel.fromJson(jsonDecode(element))));

    return cartListHistory;
  }

  void addToCartHistoryList() {
    if(sharedPreferences.containsKey(AppConstant.CART_HISTORY_LIST)){
      cartHistory = sharedPreferences.getStringList(AppConstant.CART_HISTORY_LIST)!;
    }

    for(int i=0; i<cart.length; i++){
      print('history list'+cart[i]);
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(AppConstant.CART_HISTORY_LIST, cartHistory);
    print("the length of history list is: "+ getCartHistoryList().length.toString());
    for(int j=0; j<getCartHistoryList().length; j++){
      print("the time for the order is: "+ getCartHistoryList()[j].time.toString());
    }
  }

  void removeCart(){
    cart = [];
    sharedPreferences.remove(AppConstant.CART_LIST);
  }

  void clearCartHistory(){
    removeCart();
    cartHistory = [];
    sharedPreferences.remove(AppConstant.CART_HISTORY_LIST);
  }

  
}