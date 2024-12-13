import 'package:coffe_shop_mobile_app/future/deneme2_view_model.dart';
import 'package:coffe_shop_mobile_app/product/state/address/addressBloc/address_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Deneme2 extends StatefulWidget {
  const Deneme2({super.key});

  @override
  State<Deneme2> createState() => _Deneme2State();
}

class _Deneme2State extends Deneme2ViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deneme2'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: BlocBuilder<AddressBloc, AddressState>(
              builder: (context, state) {
                if (state is AddressLoaded) {
                  return ListView.builder(
                    itemCount: state.listAddress.length,
                    itemBuilder: (context, index) {
                      final address = state.listAddress[index];

                      return ListTile(
                        title: Text(address.name!),
                        subtitle: Text(address.description!),
                        leading: Text(address.id!),
                        trailing: Text(address.note!),
                      );
                    },
                  );
                }
                if (state is AddressError) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          const Divider(),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  addDamyAddress();
                  debugPrint('--Deneme2 addDamyAddress');
                },
                child: const Text('Adres ekle'),
              ),
              ElevatedButton(
                onPressed: addressCache.removeFromList,
                child: const Text('removeFromList'),
              ),
              ElevatedButton(
                onPressed: addressCache.listeSonDurum,
                child: const Text('Liste Son Durum'),
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AddressBloc>(context).add(LoadAddressList());
                },
                child: const Text('BlockListEmitSonDurum'),
              ),
              ElevatedButton(onPressed: () {}, child: const Text(' ')),
              ElevatedButton(onPressed: () {}, child: const Text(' ')),
            ],
          ),
        ],
      ),
    );
  }
}
