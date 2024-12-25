import 'package:coffe_shop_mobile_app/future/basket/basket_view.dart';
import 'package:coffe_shop_mobile_app/future/bootom_nav_bar/state/page_provider.dart';
import 'package:coffe_shop_mobile_app/future/bootom_nav_bar/widget/bottom_nav_bar_item.dart';
import 'package:coffe_shop_mobile_app/future/favori/favorite_coffees_view.dart';
import 'package:coffe_shop_mobile_app/future/home/home_view.dart';
import 'package:coffe_shop_mobile_app/product/parcalar/y/bosekran.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarScreenV2 extends StatefulWidget {
  const BottomNavigationBarScreenV2({super.key});

  @override
  State<BottomNavigationBarScreenV2> createState() => _BottomNavigationBarScreenV2State();
}

class _BottomNavigationBarScreenV2State extends State<BottomNavigationBarScreenV2> {
  final List<Widget> _pages = const [
    HomeView(),
    FavoriteCoffeesView(),
    BasketView(),
    Bosekran(),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.watch<PageProvider>().selectedIndex;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: IndexedStack(
        index: selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: SizedBox(
          height: 80,
          child: CustomBottomNavigationBar(
            selectedIndex: selectedIndex,
            onTap: (index) => context.read<PageProvider>().updatePage(index),
          ),
        ),
      ),
    );
  }
}
