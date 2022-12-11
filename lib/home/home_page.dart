import 'package:e_milkapp/home/main_food_page.dart';
import 'package:e_milkapp/page/cart/cart_history_page.dart';
import 'package:e_milkapp/page/profile/profile_page.dart';
import 'package:e_milkapp/page/track_order/track_order_page.dart';
import 'package:e_milkapp/route/route_handler.dart';
import 'package:e_milkapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // PersistentTabController? _controller;

  int _selectedIndex = 0;
  List pages = [
    MainFoodPage(),
    TrackOrderPage(),
    CartHistory(),
    ProfilePage(),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: Colors.amber,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          currentIndex: _selectedIndex,
          onTap: onTapNav,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.archive), label: 'History'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
          ]),
    );
  }
}
