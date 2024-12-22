import 'package:coffe_shop_mobile_app/future/basket/basket_view.dart';
import 'package:coffe_shop_mobile_app/future/bootom_nav_bar/bottom_navigation_bar.dart';
import 'package:coffe_shop_mobile_app/future/coffee_detail/coffee_detail_view.dart';
import 'package:coffe_shop_mobile_app/future/home/home_view.dart';
import 'package:coffe_shop_mobile_app/future/profile/settings/address/add_new_address.dart';
import 'package:coffe_shop_mobile_app/future/splash/splash_onboarding_view.dart';
import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get routes => {
        '/basketView': (context) => const BasketView(),
        '/': (context) => const SplashOnboardingView(),
        '/bottomNavBar': (context) => const BottomNavigationBarScreenV2(),
        '/homeView': (context) => const HomeView(),
        '/coffeeDetail': (context) => const CoffeeDetailView(coffee: Coffee()),
        'addNewAddress': (context) => const AddNewAddress(),
      };
}
