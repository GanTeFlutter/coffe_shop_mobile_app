import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: ApplicationColors.kahve,
          borderRadius: BorderRadius.circular(17),
        ),
        child: const Icon(
          Icons.blur_on_sharp,
          color: ApplicationColors.white,
          size: 30,
        ),
      ),
    );
  }
}