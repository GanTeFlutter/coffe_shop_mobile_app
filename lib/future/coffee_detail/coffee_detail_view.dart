import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';
import 'package:flutter/material.dart';

part 'widget/coffee_custom_appbar.dart';

/// CoffeeDetailView sayfa icindeki verileri bir model olarak disaridan alir.
class CoffeeDetailView extends StatefulWidget {
  ///
  const CoffeeDetailView({required this.coffee, super.key});

  ///Coffee model disaridan alinir.
  final Coffee coffee;

  @override
  State<CoffeeDetailView> createState() => _CoffeeDetailViewState();
}

class _CoffeeDetailViewState extends State<CoffeeDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CoffeeDetailView'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
