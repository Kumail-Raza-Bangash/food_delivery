import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200){
      // ignore: avoid_print
      print('Got data');
      _popularProductList = []; // if we don't initialize as null, then out data will be repeated
      _popularProductList.addAll(Product.fromJson(response.body).products); // here we need to pass our model class
      update(); // getx udpate i.e setstate()
    }
    else{

    }
  }
}