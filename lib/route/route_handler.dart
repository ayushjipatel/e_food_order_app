import 'package:e_milkapp/home/home_page.dart';
import 'package:e_milkapp/home/main_food_page.dart';
import 'package:e_milkapp/page/cart/cart_page.dart';
import 'package:e_milkapp/page/food/popular_food_details.dart';
import 'package:e_milkapp/page/food/recommended_food_detail.dart';
import 'package:e_milkapp/page/login_register/forget_password.dart';
import 'package:e_milkapp/page/login_register/login_page.dart';
import 'package:e_milkapp/page/login_register/register_page.dart';
import 'package:e_milkapp/page/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashPage = '/splashScreen';
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String loginPage = "/login-page";
  static const String registerPage = "/register-page";
  static const String forgetPage = "/forget-page";
//  static const String initial = "/";
//  static const String initial = "/";
  static String getSplashPage() => '$splashPage';
  static String getLoginPage() => '$loginPage';
  static String getRegisterPage() => '$registerPage';
  static String getRecommendFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getInitial() => '$initial';
  static String getCartPage() => '$cartPage';
  static String getForgetPage() => '$forgetPage';

  static List<GetPage> routes = [
    GetPage(
        name: "/",
        page: () {
          return HomePage();
        },
        transition: Transition.fadeIn),
    GetPage(
      name: '/popular-food',
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return PopularFoodDetails(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/recommended-food',
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return RecommendedFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartPage,
      page: () {
        return CartPage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: splashPage,
        page: () {
          return SplashScreen();
        }),
    GetPage(
        name: loginPage,
        page: () {
          return LoginPageView();
        }),
    GetPage(
        name: registerPage,
        page: () {
          return RegisterPageView();
        }),
    GetPage(
        name: forgetPage,
        page: () {
          return ForgetPasswordPageView();
        }),
  ];
}
