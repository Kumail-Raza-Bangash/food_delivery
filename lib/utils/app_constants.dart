// ignore_for_file: constant_identifier_names

class AppConstant {
  static const String APP_NAME = "DBFood";
  static const int APP_VERSION = 1;

  static const String BASE_URL = "http://127.0.0.1:8000"; //http://mvs.bslmeiyu.com http://127.0.0.1:8000
  static const String POPULAR_PRODUCTS_URI = "/api/v1/products/popular";
  static const String RECOMMENDED_PRODUCTS_URI = "/api/v1/products/recommended";
  //static const String DRINKS_URI = "/api/v1/products/drinks";

  //auth end point 
  static const String REGISTRATION_URI = "/api/v1/auth/register";

  static const String UPLOAD_URL = "/uploads/";

  static const String TOKEN = "DBtoken";
  static const String CART_LIST = "cart-list";
  static const String CART_HISTORY_LIST = "cart-history-list";
}