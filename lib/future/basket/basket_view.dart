import 'package:coffe_shop_mobile_app/future/basket/basket_view_model.dart';
import 'package:coffe_shop_mobile_app/future/deneme3.dart';
import 'package:coffe_shop_mobile_app/product/state/address/addressBloc/address_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketView extends StatefulWidget {
  const BasketView({super.key});

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends BasketViewModel {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('BasketView'),
        actions: [
          IconButton(
            onPressed: () {
              locationSlectedButton(context);
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<AddressBloc, AddressState>(
              builder: (context, state) {
                if (state is AddressLoaded) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.listAddress.length,
                    itemBuilder: (context, index) {
                      final address = state.listAddress[index];
                      return ListTile(
                        title: Text(address.name!),
                        subtitle: Text(address.description!),
                        onTap: () {},
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
          ],
        ),
      ),
    );
  }
}
