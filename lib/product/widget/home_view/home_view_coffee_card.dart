import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeViewCoffeeCard extends StatefulWidget {
  final Coffee coffee;

  const HomeViewCoffeeCard({super.key, required this.coffee});

  @override
  State<HomeViewCoffeeCard> createState() => _HomeViewCoffeeCardState();
}

class _HomeViewCoffeeCardState extends State<HomeViewCoffeeCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      color: ApplicationColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ApplicationColors.black.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(widget.coffee.raiting!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.coffee.name!,
                  style: GoogleFonts.b612(
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: ApplicationColors.black),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '\$20',
                      style: GoogleFonts.b612(
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: ApplicationColors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(ApplicationColors.kahve),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_shopping_cart_rounded,
                        color: ApplicationColors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
