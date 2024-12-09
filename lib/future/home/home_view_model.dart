import 'package:coffe_shop_mobile_app/future/home/home_view.dart';
import 'package:coffe_shop_mobile_app/future/home/widget/model/home_kategory.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:flutter/material.dart';

abstract class HomeViewModel extends State<HomeView> {
  final BoxDecoration customContainerDeceration =
      CustomContainerDeceration().customContainerDeceration();

  TextEditingController searchController = TextEditingController();

  List<HomeKategori> kategoriList = [
    HomeKategori('Espresso Bazlı Kahveler', 'ebk'),
    HomeKategori('Soğuk Kahveler', 'sk'),
    HomeKategori('Sütlü Kahveler', 'stk'),
  ];
}

class CustomContainerDeceration {
  BoxDecoration customContainerDeceration() {
    return BoxDecoration(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(27),
        bottomRight: Radius.circular(27),
      ),
      color: ApplicationColors.kahvesiyah,
      boxShadow: [
        BoxShadow(
          color: ApplicationColors.black.withOpacity(0.2),
          spreadRadius: 3,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
      gradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          ApplicationColors.black,
          ApplicationColors.kahvesiyah,
        ],
      ),
    );
  }
}
