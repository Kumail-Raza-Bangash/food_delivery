import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200){
      print('Got Popular data');
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
}