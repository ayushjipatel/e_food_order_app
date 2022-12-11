import 'dart:async';

import 'package:e_milkapp/controllers/cart_controller.dart';
import 'package:e_milkapp/controllers/popular_product_controller.dart';
import 'package:e_milkapp/controllers/recommended_product_controller.dart';
import 'package:e_milkapp/route/route_handler.dart';
import 'package:e_milkapp/services/auth.dart';
import 'package:e_milkapp/utilities/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResources() async {
    Get.find<CartController>();
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    _loadResources();
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();

    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(const Duration(seconds: 3), () {
      if (Auth().currentUser != null) {
        Get.toNamed(RouteHelper.getInitial());
      } else {
        Get.toNamed(RouteHelper.getLoginPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
                child: Image.asset('assets/image/logo part 1.png',
                    width: Dimensions.splashScreen250)),
          ),
          Center(
              child: Image.asset('assets/image/logo part 2.png',
                  width: Dimensions.splashScreen250)),
        ],
      ),
    );
  }
}
