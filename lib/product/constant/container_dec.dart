import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:flutter/material.dart';

class CustomContainerDeceration {
  CustomContainerDeceration._();
  static BoxDecoration customContainerDeceration() {
    return BoxDecoration(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(27),
        bottomRight: Radius.circular(27),
      ),
      color: ApplicationColors.kahvesiyah2,
      boxShadow: [
        BoxShadow(
          // ignore: deprecated_member_use
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
          ApplicationColors.kahvesiyah2,
        ],
      ),
    );
  }
}
