// ignore_for_file: deprecated_member_use
import 'package:coffe_shop_mobile_app/future/basket/basket_view_model.dart';
import 'package:coffe_shop_mobile_app/future/basket/bloc/basket_bloc.dart';
import 'package:coffe_shop_mobile_app/future/basket/utils/constant/basket_strings.dart';
import 'package:coffe_shop_mobile_app/future/basket/utils/mixin/basket_mixin.dart';
import 'package:coffe_shop_mobile_app/future/basket/utils/widget/basket_address_text.dart';
import 'package:coffe_shop_mobile_app/future/basket/utils/widget/basket_item_card.dart';
import 'package:coffe_shop_mobile_app/future/basket/utils/widget/basket_payment.dart';
import 'package:coffe_shop_mobile_app/future/basket/utils/widget/custom_elevated_button.dart';
import 'package:coffe_shop_mobile_app/future/basket/utils/widget/indirim_button.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:coffe_shop_mobile_app/product/widget/applicaton_default_custom_button.dart';
import 'package:coffe_shop_mobile_app/product/widget/show_mbs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketView extends StatefulWidget {
  const BasketView({super.key});

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends BasketViewModel with BasketMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Text(
                BasketStrings.order,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  spacing: screenPaddingTen,
                  children: [
                    const BasketAddressText(),
                    selectedAddressButton(context),
                    IndirimBurtton(size: size),
                    buildDivider(),
                    itemCardBuilder(size),
                    const BasketPayment(),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: CustomElevatedButton(
                        borderRadius: 20,
                        onPressed: () => showOrderComplete(
                          context,
                          BasketStrings.orderCompleted,
                        ),
                        text: BasketStrings.completeOrder,
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
          data: BasketStrings.changeAddress,
          icon: Icons.edit_location_alt_outlined,
        ),
        CustomElevatedButtonBasket(
          onPressed: () {},
          data: BasketStrings.addnote,
          icon: Icons.edit,
        ),
      ],
    );
  }

  BlocBuilder<BasketBloc, BasketState> itemCardBuilder(Size size) {
    return BlocBuilder<BasketBloc, BasketState>(
      builder: (context, state) {
        if (state is BasketInitial) {
          return const Center(child: Text(BasketStrings.emptyBasketInitial));
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
