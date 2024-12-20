import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:flutter/material.dart';

class CoffeeInfoRow extends StatelessWidget {
  const CoffeeInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(Icons.motorcycle, color: ApplicationColors.kahve),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Icon(Icons.coffee, color: ApplicationColors.kahve),
        ),
        Icon(Icons.work_history_rounded, color: ApplicationColors.kahve),
      ],
    );
  }
}
