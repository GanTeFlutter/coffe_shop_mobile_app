import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KategoryButton extends StatelessWidget {
  const KategoryButton({required this.title, required this.onPressed, super.key});
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white, width: 2), // Kenarlık rengi ve kalınlığı
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Yuvarlatılmış köşeler
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20), // İç boşluk
          backgroundColor: ApplicationColors.kahve, // Arka plan rengi (şeffaf)
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: GoogleFonts.b612(
            textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ApplicationColors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}
