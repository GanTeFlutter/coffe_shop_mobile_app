import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:flutter/material.dart';

class HomeViewTextfield extends StatelessWidget {
  const HomeViewTextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search coffee',
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: ApplicationColors.white),
        prefixIcon: const Icon(
          Icons.search,
          color: ApplicationColors.white,
        ),
        filled: true,
        fillColor: ApplicationColors.kahvesiyah,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
