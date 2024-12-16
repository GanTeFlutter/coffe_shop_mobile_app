import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  static TextStyle titleMedium(BuildContext context) {
    return GoogleFonts.b612(
      textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: ApplicationColors.black,
            fontWeight: FontWeight.bold,
          ),
    );
  }

  static TextStyle bodyMedium(BuildContext context) {
    return GoogleFonts.b612(
      textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey[500],
          ),
    );
  }

  static TextStyle coffeeCardName(BuildContext context) {
    return GoogleFonts.babylonica(
      textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: ApplicationColors.black,
            fontWeight: FontWeight.w600,
          ),
    );
  }
}
