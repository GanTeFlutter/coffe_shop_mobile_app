import 'package:flutter/material.dart';

mixin CoffeeDetailMixin {
  final ValueNotifier<bool> isSelected = ValueNotifier<bool>(false);
  final List<String> sizes = ['S', 'M', 'L'];
  final ValueNotifier<String> cofeeSize = ValueNotifier<String>('S');
  final double sized = 0.05;
  void disposeMixin() {
    isSelected.dispose();
    cofeeSize.dispose();
  }
}
