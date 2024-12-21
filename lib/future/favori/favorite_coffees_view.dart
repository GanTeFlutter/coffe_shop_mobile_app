import 'package:coffe_shop_mobile_app/product/state/bottom_nav_bar/page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCoffeesView extends StatefulWidget {
  const FavoriteCoffeesView({super.key});

  @override
  State<FavoriteCoffeesView> createState() => _FavoriteCoffeesViewState();
}

class _FavoriteCoffeesViewState extends State<FavoriteCoffeesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FavoriteCoffeesView'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              
              onPressed: () {
                context.read<PageProvider>().setSelectedIndex(0);
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
