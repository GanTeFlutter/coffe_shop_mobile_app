import 'package:coffe_shop_mobile_app/future/profile/address/singleAddressBloc/single_address_bloc_bloc.dart';
import 'package:coffe_shop_mobile_app/product/constant/app_custom_text_style.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketAddressText extends StatelessWidget {
  const BasketAddressText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ApplicationStrings.deliveryaddress,
          style: AppCustomTextStyle.titleMedium(context),
        ),
        _buildAddressContent(context),
      ],
    );
  }

  Widget _buildAddressContent(BuildContext context) {
    return BlocBuilder<SingleAddressBloc, SingleAddressBlocState>(
      builder: (context, state) {
        if (state is SingleAddressBlocLoaded) {
          return _buildLoadedAddress(state);
        }
        return _buildEmptyAddress(context);
      },
    );
  }

  ListTile _buildLoadedAddress(SingleAddressBlocLoaded state) {
    return ListTile(
      title: Text(state.address.name!),
      subtitle: Text(state.address.description!),
      leading: const Icon(
        Icons.business_sharp,
        color: ApplicationColors.kahve,
      ),
    );
  }

  Widget _buildEmptyAddress(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text: ApplicationStrings.warningSign,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: ApplicationStrings.lutfenadresbelirle,
            style: AppCustomTextStyle.bodyMedium(context),
          ),
        ],
      ),
    );
  }
}
