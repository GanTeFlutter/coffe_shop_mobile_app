import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:coffe_shop_mobile_app/product/model/address/address.dart';
import 'package:coffe_shop_mobile_app/product/state/address/addressBloc/address_bloc.dart';
import 'package:coffe_shop_mobile_app/product/widget/applicaton_default_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Deneme3 extends StatefulWidget {
  const Deneme3({super.key});

  @override
  State<Deneme3> createState() => _Deneme3State();
}

class _Deneme3State extends State<Deneme3> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deneme3'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
                      onPressed: () {},
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
                                      BlocProvider.of<AddressBloc>(context).add(
                                        NewSelectedAddress(addressID: address.id!),
                                      );
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
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'name',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: 'description',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: noteController,
                decoration: const InputDecoration(
                  hintText: 'note',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final address = Address(
                    name: nameController.text,
                    description: descriptionController.text,
                    note: noteController.text,
                  );

                  BlocProvider.of<AddressBloc>(context).add(NewSaveAddress(address: address));
                },
                child: const Text('SaveNevModel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
