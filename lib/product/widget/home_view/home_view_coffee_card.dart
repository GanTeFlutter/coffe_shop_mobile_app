import 'package:coffe_shop_mobile_app/future/coffee_detail/coffee_detail_view.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeViewCoffeeCard extends StatefulWidget {
  const HomeViewCoffeeCard({required this.coffee, super.key});
  final Coffee coffee;

  @override
  State<HomeViewCoffeeCard> createState() => _HomeViewCoffeeCardState();
}

class _HomeViewCoffeeCardState extends State<HomeViewCoffeeCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      color: ApplicationColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  // ignore: inference_failure_on_instance_creation
                  MaterialPageRoute(
                    builder: (context) => CoffeeDetailView(coffee: widget.coffee),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(10),
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
                    image: Image(image: AssetImage(widget.coffee.raiting!)).image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
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
                      widget.coffee.fiyat!,
                      style: GoogleFonts.b612(
                        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: ApplicationColors.black,
                              fontWeight: FontWeight.w600,
                            ),
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
