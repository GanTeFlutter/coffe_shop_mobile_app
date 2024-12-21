import 'package:flutter/material.dart';

mixin BasketMixin {
  final double screenPaddingTen = 10;
  BorderRadius get defaultBorderRadius => BorderRadius.circular(20);

  Divider buildDivider() {
    return Divider(
      indent: 30,
      endIndent: 30,
      color: Colors.grey[300],
      thickness: 1,
    );
  }

  
}
