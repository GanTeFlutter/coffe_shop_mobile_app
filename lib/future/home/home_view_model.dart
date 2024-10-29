import 'package:coffe_shop_mobile_app/future/home/home_view.dart';
import 'package:flutter/material.dart';

abstract class HomeViewModel extends State<HomeView> {
  final containerDeceration = ScreenCustomContainerDeceration().customContainerDeceration();

  //Bunlar bloc üzerinden veri yönetimi yapılana kadar deneme amaçlı yazıldı

  bool banner = true;

  void banerisCheek() {
    setState(() {
      banner = !banner;
      eExpandetSize();
    });
  }

  int titleExpandetSize1 = 3;
  int bottomExpandetSize = 5;

  void eExpandetSize() {
    if (banner == false) {
      titleExpandetSize1 = 3;
      bottomExpandetSize = 7;
    } else {}
  }

  List<String> coffeList = [
    'Americano',
    'Cappuccino',
    'Espresso',
    'Latte',
    'Mocha',
    'Macchiato',
  ];
// listview Title filter
  int seletedIndex = 0;
  bool isFilterSecili = false;
  int? caffeFilter;
  final List<String> coffeeList = [
    'Espresso',
    'Latte',
    'Cappuccino',
    'Mocha',
    'Americano',
    'Flat White'
  ];

  String dropdownValue = 'Other';
}
