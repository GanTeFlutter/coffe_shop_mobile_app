import 'package:coffe_shop_mobile_app/future/home/widget/model/home_kategory.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KategoryButton extends StatelessWidget {
  const KategoryButton({required this.kategori, required this.onPressed, super.key});
  final HomeKategori kategori;
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
          kategori.title,
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
