import 'package:coffe_shop_mobile_app/future/coffee_detail/coffee_detail_view_model.dart';
import 'package:coffe_shop_mobile_app/future/coffee_detail/widget/size_kategory.dart';
import 'package:coffe_shop_mobile_app/product/constant/app_text_style.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeDetailView extends StatefulWidget {
  const CoffeeDetailView({required this.coffee, super.key});
  final Coffee coffee;

  @override
  State<CoffeeDetailView> createState() => _CoffeeDetailViewState();
}

class _CoffeeDetailViewState extends CoffeeDetailViewModel {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    debugPrint('--CoffeeDetailView build');
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * sized),
              appbar(context),
              SizedBox(
                height: size.height * sized,
              ),
              image(size),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                widget.coffee.name!,
                style: GoogleFonts.babylonica(
                  textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: ApplicationColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Row(
                children: [
                  Text(
                    widget.coffee.extra!,
                    style: CustomTextStyle.bodyMedium(context),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.motorcycle,
                    color: ApplicationColors.kahve,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Icon(
                      Icons.coffee,
                      color: ApplicationColors.kahve,
                    ),
                  ),
                  const Icon(
                    Icons.work_history_rounded,
                    color: ApplicationColors.kahve,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: ApplicationColors.star,
                    size: 26,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      widget.coffee.rating.toString(),
                      style: CustomTextStyle.titleMedium(context),
                    ),
                  ),
                  Text(
                    '(230)',
                    style: CustomTextStyle.bodyMedium(context),
                  ),
                ],
              ),
              Divider(
                height: 50,
                color: Colors.grey[200],
              ),
              Text(
                'Description',
                style: CustomTextStyle.titleMedium(context),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                widget.coffee.description!,
                style: CustomTextStyle.bodyMedium(context),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Size',
                  style: CustomTextStyle.titleMedium(context),
                ),
              ),
              SizedKategory(sizes: sizes, cofeeSize: cofeeSize),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price',
                          style: CustomTextStyle.bodyMedium(context),
                        ),
                        ValueListenableBuilder<String>(
                          valueListenable: cofeeSize,
                          builder: (context, value, child) {
                            final selectedPrice =
                                sizePrices[value] ?? 5.0; // Varsayılan fiyat 'S' için 5.0

                            return Text(
                              '\$${selectedPrice.toStringAsFixed(2)}', // Fiyatı göster
                              style: CustomTextStyle.titleMedium(context),
                            );
                          },
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                          backgroundColor: ApplicationColors.kahve,
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                          child: Text(
                            'Add to cart',
                            style: GoogleFonts.b612(
                              textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: ApplicationColors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row appbar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        Text(
          'Details',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        ValueListenableBuilder<bool>(
          valueListenable: isSelected,
          builder: (context, value, child) {
            return IconButton(
              onPressed: () {
                isSelected.value = !value;
              },
              icon: value
                  ? const Icon(
                      Icons.favorite,
                      color: ApplicationColors.kahve,
                      size: 30,
                    )
                  : const Icon(Icons.favorite_border),
            );
          },
        ),
      ],
    );
  }

  Hero image(Size size) {
    return Hero(
      tag: widget.coffee.id!,
      child: Container(
        height: size.height * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 10),
              blurRadius: 10,
            ),
          ],
          image: DecorationImage(
            image: AssetImage(
              widget.coffee.image!,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
