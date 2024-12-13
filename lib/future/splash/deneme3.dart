import 'package:coffe_shop_mobile_app/future/denem2.dart';
import 'package:coffe_shop_mobile_app/product/model/address/address.dart';
import 'package:coffe_shop_mobile_app/product/state/address/addressBloc/address_bloc.dart';
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
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Deneme2()));
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<Widget>(
            context: context,
            builder: (context) {
              return Container(
                height: 500,
                color: Colors.amber,
                child: BlocBuilder<AddressBloc, AddressState>(
                  builder: (context, state) {
                    if (state is AddressLoaded) {
                      return ListView.builder(
                        itemCount: state.listAddress.length,
                        itemBuilder: (context, index) {
                          final address = state.listAddress[index];
                          return ListTile(
                            title: Text(address.name!),
                            subtitle: Text(address.id!),
                          );
                        },
                      );
                    }
                    if (state is AddressError) {
                      return const Center(
                        child: Text('Error'),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
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

                  BlocProvider.of<AddressBloc>(context).add(NewSelectedAddress(address: address));
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
