import 'dart:convert';

import 'package:e_milkapp/modals/cart_model.dart';
import 'package:e_milkapp/utilities/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];
  //getting cartlist from localstorage
  void addToCartList(List<CartModel> cartList) {
    //sharedPreferences.remove(AppConstants.CART_LIST);
    //sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);

    cart = [];
    var time = DateTime.now().toString();
    //convert object to string because sharedPreferences only save as stirng

    cartList.forEach((element) {
      element.time = time;
      return cart.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);

    //print(sharedPreferences.getStringList(AppConstants.CART_LIST));

    //getCartList();
  }

//adding to cartlist to localStorage
  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;

      //print('inside getcartlist ' + carts.toString());
    }
    List<CartModel> cartList = [];

    carts.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));

    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      //cartHistory = [];
      cartHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    List<CartModel> cartListHistory = [];
    cartHistory.forEach((element) =>
        cartListHistory.add(CartModel.fromJson(jsonDecode(element))));
    return cartListHistory;
  }

  void addToCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    for (var i = 0; i < cart.length; i++) {
      //print("history List " + cart[i]);
      //print("\n getting printed " + i.toString() + "  time in loop");
      cartHistory.add(cart[i]);
    }

    removeCart();
    sharedPreferences.setStringList(
        AppConstants.CART_HISTORY_LIST, cartHistory);
    print("The Length of History list is " +
        getCartHistoryList().length.toString());
    for (var i = 0; i < getCartHistoryList().length; i++) {
      print("The time for order is " + getCartHistoryList()[i].time.toString());
    }
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstants.CART_LIST);
  }
}
