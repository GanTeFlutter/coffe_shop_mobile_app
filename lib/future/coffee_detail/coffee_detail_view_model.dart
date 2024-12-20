import 'package:coffe_shop_mobile_app/future/coffee_detail/coffee_detail_view.dart';
import 'package:coffe_shop_mobile_app/future/coffee_detail/mixin/coffee_detail_mixin.dart';
import 'package:flutter/material.dart';

abstract class CoffeeDetailViewModel extends State<CoffeeDetailView> with CoffeeDetailMixin {
  @override
  void dispose() {
    disposeMixin();
    super.dispose();
  }
}
