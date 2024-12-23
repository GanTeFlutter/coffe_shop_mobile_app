// ignore_for_file: deprecated_member_use
import 'package:coffe_shop_mobile_app/future/basket/basket_view_model.dart';
import 'package:coffe_shop_mobile_app/future/basket/bloc/basket_bloc.dart';
import 'package:coffe_shop_mobile_app/future/basket/utils/mixin/basket_mixin.dart';
import 'package:coffe_shop_mobile_app/future/basket/utils/widget/basket_address_text.dart';
import 'package:coffe_shop_mobile_app/future/basket/utils/widget/basket_item_card.dart';
import 'package:coffe_shop_mobile_app/future/basket/utils/widget/basket_payment.dart';
import 'package:coffe_shop_mobile_app/future/basket/utils/widget/custom_elevated_button.dart';
import 'package:coffe_shop_mobile_app/future/basket/utils/widget/indirim_button.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_strings.dart';
import 'package:coffe_shop_mobile_app/future/bootom_nav_bar/state/page_provider.dart';
import 'package:coffe_shop_mobile_app/product/widget/applicaton_default_custom_button.dart';
import 'package:coffe_shop_mobile_app/product/widget/show_mbs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class BasketView extends StatefulWidget {
  const BasketView({super.key});

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends BasketViewModel with BasketMixin {
  @override
  Widget build(BuildContext context) {
    debugPrint('--BasketView build');
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Column(
              children: [
                Column(
                  spacing: screenPaddingTen,
                  children: [
                    const BasketAddressText(),
                    selectedAddressButton(context),
                    IndirimBurtton(size: size),
                    divider(),
                    itemCardBuilder(size),
                    const BasketPayment(),
                    BlocBuilder<BasketBloc, BasketState>(
                      builder: (context, state) {
                        if (state is BasketLoaded) {
                          return Column(
                            children: [
                              CustomElevatedButton(
                                onPressed: () {
                                  state.basket.items.isEmpty
                                      ? context.read<PageProvider>().updatePage(0)
                                      : ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text('Siparişiniz alındı.'),
                                          ),
                                        );
                                },
                                text: state.basket.items.isEmpty
                                    ? ApplicationStrings.emptyBasket
                                    : ApplicationStrings.alisverisitamamla,
                              ),
                              const SizedBox(height: 50),
                              if (state.basket.items.isEmpty)
                                Lottie.asset('assets/lottie/sepetbos.json'),
                            ],
                          );
                        }
                        return Center(
                          child: Lottie.asset('assets/lottie/sepetbos.json'),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Divider divider() {
    return Divider(
      indent: 30,
      endIndent: 30,
      color: Colors.grey[300],
      thickness: 1,
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

  BlocBuilder<BasketBloc, BasketState> itemCardBuilder(Size size) {
    return BlocBuilder<BasketBloc, BasketState>(
      builder: (context, state) {
        if (state is BasketInitial) {
          return const Center(child: Text(ApplicationStrings.emptyBasketInitial));
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
