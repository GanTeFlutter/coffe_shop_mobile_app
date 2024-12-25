import 'package:coffe_shop_mobile_app/future/basket/state/bloc/basket_bloc.dart';
import 'package:coffe_shop_mobile_app/future/bootom_nav_bar/state/page_provider.dart';
import 'package:coffe_shop_mobile_app/product/constant/app_custom_text_style.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_strings.dart';
import 'package:coffe_shop_mobile_app/product/widget/applicaton_default_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketPayment extends StatefulWidget {
  const BasketPayment({super.key});

  @override
  State<BasketPayment> createState() => _BasketPaymentState();
}

class _BasketPaymentState extends State<BasketPayment> {
  final double screenPaddingTen = 10;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketBloc, BasketState>(
      builder: (context, state) {
        if (state is BasketLoaded) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: ApplicationColors.white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ApplicationStrings.paymentsum,
                      style: AppCustomTextStyle.titleMedium(context),
                    ),
                    Row(
                      children: [
                        Text(
                          ApplicationStrings.totalPrice,
                          style: AppCustomTextStyle.bodyMedium(context),
                        ),
                        const Spacer(),
                        Text(
                          '${state.toplamTutar} Tl',
                          style: AppCustomTextStyle.bodyMedium(context),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          ApplicationStrings.toplamadet,
                          style: AppCustomTextStyle.bodyMedium(context),
                        ),
                        const Spacer(),
                        Text(
                          state.toplamAdet.toString(),
                          style: AppCustomTextStyle.bodyMedium(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return CustomElevatedButton(
          onPressed: () {
            context.read<PageProvider>().updatePage(0);
          },
          text: ApplicationStrings.hemenalisverisebasla,
        );
      },
    );
  }
}
