// ignore_for_file: constant_identifier_names

class AppConstant {
  static const String APP_NAME = "DBFood";
  static const int APP_VERSION = 1;

  static const String BASE_URL = "http://mvs.bslmeiyu.com"; //http://mvs.bslmeiyu.com http://127.0.0.1:8000
  static const String POPULAR_PRODUCTS_URI = "/api/v1/products/popular";
  static const String RECOMMENDED_PRODUCTS_URI = "/api/v1/products/recommended";
  //static const String DRINKS_URI = "/api/v1/products/drinks";

  //user and auth end point 
  static const String REGISTRATION_URI = "/api/v1/auth/register";
  static const String LOGIN_URI = "/api/v1/auth/login";
  static const String USER_INFO_URI = "/api/v1/customer/info";

  static const String UPLOAD_URL = "/uploads/";

  static const String USER_ADDRESS = "user-address";
  static const String GEOCODE_URI = "/api/v1/config/geocode-api";

  static const String TOKEN = "";
  static const String PHONE = "";
  static const String PASSWORD = "";
  static const String CART_LIST = "cart-list";
  static const String CART_HISTORY_LIST = "cart-history-list";
}