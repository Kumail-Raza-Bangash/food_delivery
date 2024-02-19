import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200){
      _popularProductList = []; // if we don't initialize as null, then out data will be repeated
      //_popularProductList.addAll(); // here we need to pass our model class
      update(); // getx udpate i.e setstate()
    }
    else{

    }
  }
}