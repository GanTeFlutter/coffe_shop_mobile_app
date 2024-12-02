import 'package:coffe_shop_mobile_app/future/home/home_view_model.dart';
import 'package:coffe_shop_mobile_app/future/home/widget/custom_textfield.dart';
import 'package:coffe_shop_mobile_app/future/home/widget/filter_button.dart';
import 'package:coffe_shop_mobile_app/future/home/widget/location_text_button.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          //
          //Üst kısım
          //
          Expanded(
            flex: 2,
            child: Container(
              decoration: customContainerDeceration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButtonLocation(onPressed: () {}),
                  Row(
                    children: [
                      HomeViewTextfield(searchController: searchController),
                      const FilterButton(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          //
          //Alt kısım
          //
          const Expanded(
              flex: 4,
              child: Column(
                children: [],
              )),
        ],
      ),
    );
  }
}
