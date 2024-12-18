import 'package:coffe_shop_mobile_app/future/basket/bloc/basket_bloc.dart';
import 'package:coffe_shop_mobile_app/product/constant/app_custom_text_style.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_strings.dart';
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
            margin: EdgeInsets.all(screenPaddingTen),
            color: ApplicationColors.white,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(screenPaddingTen),
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
                          'Toplam Tutar',
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
        return const Center(
          child: Text('Sepetinizde ürün bulunmamaktadır.'),
        );
      },
    );
  }
}
