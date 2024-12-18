import 'package:coffe_shop_mobile_app/future/coffee_detail/coffee_detail_view_model.dart';
import 'package:coffe_shop_mobile_app/future/coffee_detail/widget/cd_custom_button.dart';
import 'package:coffe_shop_mobile_app/future/coffee_detail/widget/size_kategory.dart';
import 'package:coffe_shop_mobile_app/product/constant/app_custom_text_style.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_strings.dart';
import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';
import 'package:flutter/material.dart';

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
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * sized),
              appbar(context),
              image(size),
              Text(widget.coffee.name!, style: AppCustomTextStyle.coffeeCardName(context)),
              Row(
                children: [
                  Text(
                    widget.coffee.extra!,
                    style: AppCustomTextStyle.bodyMedium(context),
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
                      style: AppCustomTextStyle.titleMedium(context),
                    ),
                  ),
                  Text(
                    '(230)',
                    style: AppCustomTextStyle.bodyMedium(context),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey[200],
              ),
              Text(
                ApplicationStrings.description,
                style: AppCustomTextStyle.titleMedium(context),
              ),
              Text(
                widget.coffee.description!,
                style: AppCustomTextStyle.bodyMedium(context),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  ApplicationStrings.cdsize,
                  style: AppCustomTextStyle.titleMedium(context),
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
                          '${widget.coffee.price} Tl',
                          style: AppCustomTextStyle.titleMedium(context),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const CdCustomButton(),
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
