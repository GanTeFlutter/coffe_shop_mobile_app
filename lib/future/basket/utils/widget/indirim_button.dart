// ignore_for_file: deprecated_member_use

import 'package:coffe_shop_mobile_app/future/basket/utils/constant/basket_strings.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:flutter/material.dart';

class IndirimBurtton extends StatelessWidget {
  const IndirimBurtton({
    required this.size,
    super.key,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: size.width * 0.9,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ApplicationColors.acikbeyaz,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: ApplicationColors.kahve.withOpacity(0.5),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconIndirim(
            Icons.percent_rounded,
            25,
          ),
          const SizedBox(width: 12),
          Text(
            BasketStrings.indirim,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ApplicationColors.kahve,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
          ),
          const SizedBox(width: 12),
          iconIndirim(
            Icons.arrow_forward_ios_rounded,
            20,
          ),
        ],
      ),
    );
  }

  Container iconIndirim(IconData? icon, double? size) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: ApplicationColors.kahve.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: ApplicationColors.kahve,
        size: size,
      ),
    );
  }
}
