import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:coffe_shop_mobile_app/product/state/address/singleAddressBloc/single_address_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextButtonLocation extends StatelessWidget {
  const TextButtonLocation({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 10, left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Location',
            style: TextStyle(color: ApplicationColors.grey),
          ),
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<SingleAddressBlocBloc, SingleAddressBlocState>(
                  builder: (context, state) {
                    if (state is SingleAddressBlocLoaded) {
                      return Text(
                        state.address.name ?? 'Lütfen bir Konum Seçiniz',
                        style: const TextStyle(
                          color: ApplicationColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else {
                      return const Text(
                        'Add New Address',
                        style: TextStyle(
                          color: ApplicationColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.location_on_rounded,
                  color: ApplicationColors.kahve,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
