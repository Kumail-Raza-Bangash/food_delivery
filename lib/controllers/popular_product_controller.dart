import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  late CartController _cart;

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200){
      //print('Got Popular data');
      _popularProductList = []; // if we don't initialize as null, then out data will be repeated
      _popularProductList.addAll(Product.fromJson(response.body).products); // here we need to pass our model class
      //print(_popularProductList);
      _isLoaded = true;
      update(); // getx udpate i.e setstate()
    }
    else{
      print('Couldn\'t  Got Popular data');
    }
  }

  void setQuanitity(bool isIncreament){
    if(isIncreament){
      _quantity = checkQuantity(_quantity + 1);
    }
    else{
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity){
    if(quantity<0){
      Get.snackbar("Iterm Count", "You can't reduce more",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white,
      );
      return 0;
    }
    else if (quantity > 20){
      Get.snackbar("Iterm Count", "You can't add more",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white,
      );
      return 20;
    }
    else{
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart){
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;

    var exist = false;
    exist = _cart.existInCart(product);
    //if exist
    //get from storage _inCartItems
    print("Exist or not: "+exist.toString());
    if(exist){
      _inCartItems = _cart.getQuantity(product);
      print("The quantity in cart is: "+_inCartItems.toString());
    }
  }

  void addItem (ProductModel product){
    if(_quantity>0){
      _cart.addItem(product, _quantity);
      _quantity = 0;

      _cart.items.forEach((key, value) {
        print("The id is: "+value.id.toString()+" The quantity is: "+value.quantity.toString());
      });

    }
    else {
      Get.snackbar("Iterm Count", "You should at least at an item in the cart",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white,
      );
    }
    
  }

}