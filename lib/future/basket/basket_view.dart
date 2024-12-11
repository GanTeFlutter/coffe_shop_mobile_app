// ignore_for_file: public_member_api_docs

import 'package:coffe_shop_mobile_app/future/coffee_detail/coffee_detail_view.dart';
import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';
import 'package:flutter/material.dart';

class BasketView extends StatefulWidget {
  const BasketView({super.key});

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deneme'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 300,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    // ignore: inference_failure_on_instance_creation
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CoffeeDetailView(
                        coffee: Coffee(
                          id: '1',
                          name: 'Espresso',
                          image: 'assets/coffee/ebk/codee_image (5).jpg',
                          price: '5.00',
                        ),
                      ),
                    ),
                  );
                },
                child: Hero(
                  tag: 'hero1',
                  child: SizedBox(
                    width: 350,
                    child: Image.asset('assets/coffee/ebk/codee_image (5).jpg'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
