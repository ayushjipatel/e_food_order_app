import 'package:e_milkapp/controllers/cart_controller.dart';
import 'package:e_milkapp/data/api/api_client.dart';
import 'package:e_milkapp/data/repositories/cart_repo.dart';
import 'package:e_milkapp/data/repositories/popular_product_repo.dart';
import 'package:e_milkapp/utilities/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/popular_product_controller.dart';
import '../controllers/recommended_product_controller.dart';
import '../data/repositories/recommended_product_repo.dart';

Future<void> init() async {
//shared_preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
//apiclient
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
//repos
  //popular
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  //recommended
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  //cart
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
//controllers
  //popular
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  //recommended
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  //cart
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
