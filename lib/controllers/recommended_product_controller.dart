import 'package:food_delivery/data/repository/recommended_product_repo.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {

  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo.getRecommendedProductList();

    if (response.statusCode == 200){
      //print('Got Recommemnded data');
      _recommendedProductList = []; // if we don't initialize as null, then out data will be repeated
      _recommendedProductList.addAll(Product.fromJson(response.body).products); // here we need to pass our model class
      //print(_recommended ProductList);
      _isLoaded = true;
      update(); // getx udpate i.e setstate()
    }
    else{
      print('Couldn\'t Got Recommemnded data');
    }
  }
}