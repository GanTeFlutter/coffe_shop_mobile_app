import 'package:coffe_shop_mobile_app/future/coffee_detail/coffee_detail_view_model.dart';
import 'package:coffe_shop_mobile_app/future/coffee_detail/widget/cd_custom_button.dart';
import 'package:coffe_shop_mobile_app/future/coffee_detail/widget/coffee_app_bar.dart';
import 'package:coffe_shop_mobile_app/future/coffee_detail/widget/coffee_image.dart';
import 'package:coffe_shop_mobile_app/future/coffee_detail/widget/coffee_info_row.dart';
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

class _CoffeeDetailViewState extends CoffeeDetailViewModel  {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * sized),
            CoffeeAppBar(
              isSelected: isSelected,
              onBackPressed: () => Navigator.pop(context),
            ),
            CoffeeImage(
              imageUrl: widget.coffee.image!,
              heroTag: widget.coffee.id!,
              size: size,
            ),
            _buildCoffeeInfo(),
            const CoffeeInfoRow(),
            _buildRatingRow(),
            _buildDivider(),
            _buildDescription(),
            _buildSizeSelection(),
            const Spacer(),
            _buildPriceAndButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCoffeeInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.coffee.name!,
          style: AppCustomTextStyle.coffeeCardName(context),
        ),
        Text(
          widget.coffee.extra!,
          style: AppCustomTextStyle.bodyMedium(context),
        ),
      ],
    );
  }

  Widget _buildRatingRow() {
    return Row(
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
    );
  }

  Widget _buildDivider() {
    return Divider(color: Colors.grey[200]);
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ApplicationStrings.description,
          style: AppCustomTextStyle.titleMedium(context),
        ),
        Text(
          widget.coffee.description!,
          style: AppCustomTextStyle.bodyMedium(context),
        ),
      ],
    );
  }

  Widget _buildSizeSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            ApplicationStrings.cdsize,
            style: AppCustomTextStyle.titleMedium(context),
          ),
        ),
        SizedKategory(sizes: sizes, cofeeSize: cofeeSize),
      ],
    );
  }

  Widget _buildPriceAndButton() {
    return Padding(
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
    );
  }
}
