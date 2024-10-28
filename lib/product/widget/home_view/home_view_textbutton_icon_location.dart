import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:flutter/material.dart';

class HomeViewTextButtonIconLocation extends StatefulWidget {
  final VoidCallback onPressed;
  const HomeViewTextButtonIconLocation({
    super.key,
    required this.onPressed,
  });

  @override
  State<HomeViewTextButtonIconLocation> createState() => _HomeViewTextButtonIconLocationState();
}

class _HomeViewTextButtonIconLocationState extends State<HomeViewTextButtonIconLocation> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: widget.onPressed,
      label: Text('Turkey, Istanbul',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ApplicationColors.white)),
      icon: const Icon(
        Icons.location_on_rounded,
        color: ApplicationColors.kahve,
      ),
    );
  }
}
