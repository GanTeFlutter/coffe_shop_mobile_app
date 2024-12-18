// ignore_for_file: deprecated_member_use

import 'package:coffe_shop_mobile_app/future/basket/basket_view_model.dart';
import 'package:coffe_shop_mobile_app/future/basket/bloc/basket_bloc.dart';
import 'package:coffe_shop_mobile_app/future/basket/widget/basket_item_card.dart';
import 'package:coffe_shop_mobile_app/future/basket/widget/basket_payment.dart';
import 'package:coffe_shop_mobile_app/future/basket/widget/custom_elevated_button.dart';
import 'package:coffe_shop_mobile_app/future/basket/widget/indirim_button.dart';
import 'package:coffe_shop_mobile_app/product/constant/app_custom_text_style.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_strings.dart';
import 'package:coffe_shop_mobile_app/product/state/address/singleAddressBloc/single_address_bloc_bloc.dart';
import 'package:coffe_shop_mobile_app/product/widget/applicaton_default_custom_button.dart';
import 'package:coffe_shop_mobile_app/product/widget/show_mbs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketView extends StatefulWidget {
  const BasketView({super.key});

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends BasketViewModel {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Text(
                ApplicationStrings.order,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  spacing: screenPaddingTen,
                  children: [
                    selectedAddressText(context),
                    selectedAddressButton(context),
                    IndirimBurtton(size: size),
                    Divider(
                      indent: 30,
                      endIndent: 30,
                      color: Colors.black.withOpacity(0.5),
                      thickness: 1,
                    ),
                    itemCardBuilder(size),
                    const BasketPayment(),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: CustomElevatedButton(
                        borderRadius: 20,
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Alışverişiniz tamamlandı.'),
                            ),
                          );
                        },
                        text: 'Complete Order',
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

  Row selectedAddressButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomElevatedButtonBasket(
          onPressed: () {
            CustomModalBottomSheet.showAddressModal(context);
          },
          data: ApplicationStrings.changeAddress,
          icon: Icons.edit_location_alt_outlined,
        ),
        CustomElevatedButtonBasket(
          onPressed: () {},
          data: ApplicationStrings.addnote,
          icon: Icons.edit,
        ),
      ],
    );
  }

  Padding selectedAddressText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ApplicationStrings.deliveryaddress,
            style: AppCustomTextStyle.titleMedium(context),
          ),
          BlocBuilder<SingleAddressBloc, SingleAddressBlocState>(
            builder: (context, state) {
              if (state is SingleAddressBlocLoaded) {
                return ListTile(
                  title: Text(state.address.name!),
                  subtitle: Text(state.address.description!),
                  leading: const Icon(
                    Icons.business_sharp,
                    color: ApplicationColors.kahve,
                  ),
                );
              } else {
                return Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: '!! ',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ApplicationStrings.lutfenadresbelirle,
                        style: AppCustomTextStyle.bodyMedium(
                          context,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  BlocBuilder<BasketBloc, BasketState> itemCardBuilder(Size size) {
    return BlocBuilder<BasketBloc, BasketState>(
      builder: (context, state) {
        if (state is BasketInitial) {
          return const Center(child: Text(''));
        }
        if (state is BasketLoaded) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.all(screenPaddingTen),
            color: ApplicationColors.white,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.basket.items.length,
              itemBuilder: (context, index) {
                final item = state.basket.items[index];
                return BasketItemCard(item: item, size: size);
              },
            ),
          );
        } else {
          return const Text('');
        }
      },
    );
  }
}
