// ignore_for_file: use_build_context_synchronously

import 'package:coffe_shop_mobile_app/future/home/home_view.dart';
import 'package:coffe_shop_mobile_app/future/home/model/home_kategory.dart';
import 'package:coffe_shop_mobile_app/product/constant/container_dec.dart';
import 'package:flutter/material.dart';

abstract class HomeViewModel extends State<HomeView> {
  final BoxDecoration customContainerDeceration =
      CustomContainerDeceration.customContainerDeceration();
  TextEditingController searchController = TextEditingController();
  List<HomeKategori> kategoriList = [
    HomeKategori('Espresso Bazlı Kahveler', 'ebk'),
    HomeKategori('Soğuk Kahveler', 'sk'),
    HomeKategori('Sütlü Kahveler', 'stk'),
  ];
}
