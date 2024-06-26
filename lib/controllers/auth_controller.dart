import 'package:food_delivery/data/repository/auth_repo.dart';
import 'package:food_delivery/models/response_model.dart';
import 'package:food_delivery/models/signup_body_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({
    required this.authRepo,
  });

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<ResponseModel> registration (SignUpBody signUpBody) async {
    _isLoaded = true;
    update();
    Response response = await authRepo.registration(signUpBody);

    late ResponseModel responseModel;

    if(response.statusCode==200){
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
    }
    else{
      responseModel = ResponseModel(false, response.statusText!);
    }

    _isLoaded = false;
    update();
    return responseModel;
  }

  void saveUserNumberAndPassword(String number, String password) {
    authRepo.saveUserNumberAndPassword(number, password);
  }

  Future<ResponseModel> login (String email, String password) async {
    print("Getting Token");
    print(authRepo.getUserToken().toString());
    _isLoaded = true;
    update();
    Response response = await authRepo.login(email, password);

    late ResponseModel responseModel;

    if(response.statusCode==200){
      print("Backend Token");
      authRepo.saveUserToken(response.body["token"]);
      print(response.body["token"].toString());
      responseModel = ResponseModel(true, response.body["token"]);
    }
    else{
      responseModel = ResponseModel(false, response.statusText!);
    }

    _isLoaded = false;
    update();
    return responseModel;
  }

  bool userLoggedIn() {
    return authRepo.userLoggedIn();
  }

  bool clearSharedData() {
    return authRepo.clearSharedData();
  }



}