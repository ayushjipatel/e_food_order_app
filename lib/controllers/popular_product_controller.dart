import 'package:e_milkapp/controllers/cart_controller.dart';
import 'package:e_milkapp/data/repositories/popular_product_repo.dart';
import 'package:e_milkapp/modals/cart_model.dart';
import 'package:e_milkapp/modals/product_models.dart';
import 'package:e_milkapp/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;

  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantitiy = 0;
  int get quantity => _quantitiy;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantitiy;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      //print(_popularProductList);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantitiy = checkQuantity(_quantitiy + 1);
    } else {
      _quantitiy = checkQuantity(_quantitiy - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((quantity + _inCartItems) < 0) {
      Get.snackbar("Item Count", "You Can't Reduce More",
          colorText: Colors.white, backgroundColor: AppColors.mainColor);
      if (_inCartItems > 0) {
        _quantitiy = -_inCartItems;
        return _quantitiy;
      }
      return 0;
    } else if ((quantity + _inCartItems) > 20) {
      Get.snackbar("Item Count", "You Can't Increase More",
          colorText: Colors.white, backgroundColor: AppColors.mainColor);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantitiy = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);

    //getFrom storage

    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
  }

  void addItems(ProductModel product) {
    _cart.addItem(product, _quantitiy);
    _quantitiy = 0;
    _inCartItems = _cart.getQuantity(product);
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
