import 'package:flutter/material.dart';

mixin BasketMixin {
  final double screenPaddingTen = 10;
  BorderRadius get defaultBorderRadius => BorderRadius.circular(20);

  Divider buildDivider() {
    return Divider(
      indent: 30,
      endIndent: 30,
      // ignore: deprecated_member_use
      color: Colors.black.withOpacity(0.5),
      thickness: 1,
    );
  }

  void showOrderComplete(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
