// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:coffe_shop_mobile_app/product/parcalar/enums/e.app_routes.dart';
import 'package:coffe_shop_mobile_app/product/state/address/addressBloc/address_bloc.dart';
import 'package:coffe_shop_mobile_app/product/state/address/singleAddressBloc/single_address_bloc_bloc.dart';
import 'package:coffe_shop_mobile_app/product/widget/applicaton_default_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomModalBottomSheet {
  static Future<void> showAddressModal(BuildContext context) async {
    await showModalBottomSheet<void>(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: CustomElevatedButton(
                borderRadius: 20,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.addNewAddress.name).then((_) {
                    Navigator.pop(context);
                  });
                },
                text: 'Add New Address',
              ),
            ),
            Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
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
                                borderRadius: BorderRadius.circular(10),
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
                                BlocProvider.of<SingleAddressBloc>(context).add(
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
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
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
