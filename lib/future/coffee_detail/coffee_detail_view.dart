import 'package:coffe_shop_mobile_app/future/coffee_detail/coffee_detail_view_model.dart';
import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeDetailView extends StatefulWidget {
  const CoffeeDetailView({required this.coffee, super.key});
  final Coffee coffee;

  @override
  State<CoffeeDetailView> createState() => _CoffeeDetailViewState();
}

class _CoffeeDetailViewState extends CoffeeDetailViewModel {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                const Text('Details'),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                ),
              ],
            ),
            Hero(
              tag: 'hero1',
              child: Container(
                height: size.height * 0.25,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 10),
                      blurRadius: 10,
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(widget.coffee.image!),
                    fit: BoxFit.cover,
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
