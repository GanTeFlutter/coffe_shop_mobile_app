import 'dart:async';
import 'package:coffe_shop_mobile_app/future/basket/basket_view.dart';
import 'package:coffe_shop_mobile_app/future/coffee_detail/coffee_detail_view.dart';
import 'package:coffe_shop_mobile_app/product/init/app_initialize.dart';
import 'package:coffe_shop_mobile_app/product/init/state_initialize.dart';
import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await AppInitialize().make();
  runApp(const StateInitialize(child: _MyApp()));
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const BasketView (),
    );
  }
}
