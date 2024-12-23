import 'package:coffe_shop_mobile_app/future/profile/address/add_news_ad_view_model.dart';
import 'package:coffe_shop_mobile_app/future/profile/address/addressBloc/address_bloc.dart';
import 'package:coffe_shop_mobile_app/product/constant/app_custom_text_style.dart';
import 'package:coffe_shop_mobile_app/product/model/address/address.dart';
import 'package:coffe_shop_mobile_app/product/widget/applicaton_default_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends AddNewsAdViewModel {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: size.height * sized),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const Spacer(),
                  Text('Add New Address', style: AppCustomTextStyle.titleMedium(context)),
                  const Spacer(),
                ],
              ),
              SvgPicture.string(
                mapSvg,
                width: 300,
              ),
              Text(
                'I need your full address so I can ship your order to you.',
                style: AppCustomTextStyle.bodyMedium(context),
              ),
              SizedBox(height: size.height * textfSize),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    TextField(
                      controller: addressNameController,
                      decoration: const InputDecoration(
                        labelText: 'Address Name',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: cityController,
                            decoration: const InputDecoration(
                              labelText: 'City',
                              hintText: 'Enter your city',
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: streetController,
                            decoration: const InputDecoration(
                              labelText: 'Street/Avenue',
                              hintText: 'Elm Street',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * textfSize),
                    Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: buildingNodController,
                            decoration: const InputDecoration(
                              labelText: 'Building No',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: floor,
                            decoration: const InputDecoration(
                              labelText: 'Floor',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: apartmentController,
                            decoration: const InputDecoration(
                              labelText: 'Apartment No',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * sized),
                    TextField(
                      controller: address,
                      decoration: const InputDecoration(
                        labelText: 'Address ',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * sized),
              CustomElevatedButton(
                borderRadius: 20,
                onPressed: () {
                  final newAddress = Address(
                    name: addressNameController.text,
                    description: address.text,
                  );
                  BlocProvider.of<AddressBloc>(context).add(
                    NewSaveAddress(address: newAddress),
                  );
                  Navigator.pop(context);
                },
                text: 'Save new Address',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
