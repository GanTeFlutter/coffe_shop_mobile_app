import 'package:coffe_shop_mobile_app/future/basket/basket_view.dart';
import 'package:coffe_shop_mobile_app/future/bootomNavBar/bottom_navigation_bar.dart';
import 'package:coffe_shop_mobile_app/future/coffee_detail/coffee_detail_view.dart';
import 'package:coffe_shop_mobile_app/future/home/home_view.dart';
import 'package:coffe_shop_mobile_app/future/settings/add_new_address.dart';
import 'package:coffe_shop_mobile_app/future/splash/splash_view.dart';
import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get routes => {
        'work': (context) => const BasketView(),
        '/': (context) => const SplashViewLottie(),
        '/splashView': (context) => const SplashView(),
        '/bottomNavBar': (context) => const BottomNavigationBarScreenV2(),
        '/homeView': (context) => const HomeView(),
        '/coffeeDetail': (context) => const CoffeeDetailView(coffee: Coffee()),
        'addNewAddress': (context) => const AddNewAddress(),
      };
}
