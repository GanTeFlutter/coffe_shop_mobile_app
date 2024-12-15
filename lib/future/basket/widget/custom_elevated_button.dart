import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButtonBasket extends StatelessWidget {
  const CustomElevatedButtonBasket({
    required this.onPressed,
    required this.data,
    super.key,
    this.icon = Icons.add,
  });
  final IconData? icon;
  final VoidCallback onPressed;
  final String data;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
      icon: Icon(
        icon,
        color: ApplicationColors.kahve,
      ),
      onPressed: onPressed,
      label: Text(
        data,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: ApplicationColors.black,
            ),
      ),
    );
  }
}
