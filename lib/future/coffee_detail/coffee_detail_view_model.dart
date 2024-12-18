import 'package:coffe_shop_mobile_app/future/coffee_detail/coffee_detail_view.dart';
import 'package:flutter/material.dart';

abstract class CoffeeDetailViewModel extends State<CoffeeDetailView> {
  final double sized = 0.05;
  final ValueNotifier<bool> isSelected = ValueNotifier<bool>(false);
  final List<String> sizes = ['S', 'M', 'L'];
  final ValueNotifier<String> cofeeSize = ValueNotifier<String>('S');
}
