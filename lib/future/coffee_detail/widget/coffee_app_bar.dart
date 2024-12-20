import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:flutter/material.dart';

class CoffeeAppBar extends StatelessWidget {
  const CoffeeAppBar({required this.isSelected, required this.onBackPressed, super.key});


  final ValueNotifier<bool> isSelected;
  final VoidCallback onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onBackPressed,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        Text(
          'Details',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        _buildFavoriteButton(),
      ],
    );
  }

  Widget _buildFavoriteButton() {
    return ValueListenableBuilder<bool>(
      valueListenable: isSelected,
      builder: (context, value, child) {
        return IconButton(
          onPressed: () => isSelected.value = !value,
          icon: value
              ? const Icon(
                  Icons.favorite,
                  color: ApplicationColors.kahve,
                  size: 30,
                )
              : const Icon(Icons.favorite_border),
        );
      },
    );
  }
}
