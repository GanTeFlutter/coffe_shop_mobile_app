// ignore_for_file: use_build_context_synchronously

import 'package:coffe_shop_mobile_app/future/home/home_view.dart';
import 'package:coffe_shop_mobile_app/future/home/model/home_kategory.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:coffe_shop_mobile_app/product/enums/e.app_routes.dart';
import 'package:coffe_shop_mobile_app/product/state/address/addressBloc/address_bloc.dart';
import 'package:coffe_shop_mobile_app/product/state/address/singleAddressBloc/single_address_bloc_bloc.dart';
import 'package:coffe_shop_mobile_app/product/widget/applicaton_default_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class HomeViewModel extends State<HomeView> {
  final BoxDecoration customContainerDeceration =
      CustomContainerDeceration().customContainerDeceration();
  TextEditingController searchController = TextEditingController();
  List<HomeKategori> kategoriList = [
    HomeKategori('Espresso Bazlı Kahveler', 'ebk'),
    HomeKategori('Soğuk Kahveler', 'sk'),
    HomeKategori('Sütlü Kahveler', 'stk'),
  ];

  void locationSlectedButton(BuildContext context) {
    showModalBottomSheet<Widget>(
      backgroundColor: ApplicationColors.acikbeyaz,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: CustomElevatedButton(
                borderRadius: 20,
                backgroundColor: ApplicationColors.kahve,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.addNewAddress.name).then((_) {
                    Navigator.pop(context);
                  });
                },
                text: 'Add New Address',
              ),
            ),
            Card(
              color: ApplicationColors.acikbeyaz,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.grey.shade100],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: BlocBuilder<AddressBloc, AddressState>(
                  builder: (context, state) {
                    if (state is AddressLoaded) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.listAddress.length,
                        itemBuilder: (context, index) {
                          final address = state.listAddress[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              tileColor: Colors.grey.shade200,
                              title: Text(
                                address.name!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(
                                address.description!,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              leading: Text(address.id!),
                              trailing: const Icon(Icons.home_filled),
                              onTap: () {
                                BlocProvider.of<SingleAddressBlocBloc>(context).add(
                                  AddSingleAddress(address),
                                );
                                Navigator.pop(context);
                              },
                            ),
                          );
                        },
                      );
                    }
                    if (state is AddressError) {
                      return const Center(
                        child: Text(
                          'Error',
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class CustomContainerDeceration {
  BoxDecoration customContainerDeceration() {
    return BoxDecoration(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(27),
        bottomRight: Radius.circular(27),
      ),
      color: ApplicationColors.kahvesiyah,
      boxShadow: [
        BoxShadow(
          // ignore: deprecated_member_use
          color: ApplicationColors.black.withOpacity(0.2),
          spreadRadius: 3,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
      gradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          ApplicationColors.black,
          ApplicationColors.kahvesiyah,
        ],
      ),
    );
  }
}
