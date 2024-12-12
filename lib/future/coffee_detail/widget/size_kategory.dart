import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SizedKategory extends StatelessWidget {
  const SizedKategory({
    required this.sizes,
    required this.cofeeSize,
    super.key,
  });

  final List<String> sizes;
  final ValueNotifier<String> cofeeSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sizes.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ValueListenableBuilder<String>(
            valueListenable: cofeeSize,
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(100, 45),
                      side: BorderSide(
                        color: value == sizes[index] ? ApplicationColors.kahve : Colors.white,
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      backgroundColor:
                          value == sizes[index] ? ApplicationColors.kahve : Colors.white,
                    ),
                    onPressed: () {
                      cofeeSize.value = sizes[index]; // Yeni değeri güncelle
                    },
                    child: Text(
                      sizes[index],
                      style: GoogleFonts.b612(
                        textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: value == sizes[index]
                                  ? ApplicationColors.white
                                  : ApplicationColors.kahve,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
