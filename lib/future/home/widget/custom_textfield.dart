import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_strings.dart';
import 'package:flutter/material.dart';

class HomeViewTextfield extends StatelessWidget {
  const HomeViewTextfield({
    required this.searchController,
    super.key,
  });
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: SizedBox(
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: ApplicationStrings.searchcoffe,
              hintStyle:
                  Theme.of(context).textTheme.bodyMedium?.copyWith(color: ApplicationColors.white),
              prefixIcon: const Icon(
                Icons.search,
                color: ApplicationColors.white,
              ),
              filled: true,
              fillColor: ApplicationColors.kahvesiyah2,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
