import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeDetailView extends StatefulWidget {
  ///
  const CoffeeDetailView({required this.coffee, super.key});

  final Coffee coffee;

  @override
  State<CoffeeDetailView> createState() => _CoffeeDetailViewState();
}

class _CoffeeDetailViewState extends State<CoffeeDetailView> {
  String _selectedSize = 'M'; // Varsayılan seçilen boyut
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16), // Genel padding
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back_ios),
                    const Spacer(),
                    Text(
                      'Detail',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: ApplicationColors.kahve,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                        size: 25,
                        color: isFavorite ? Colors.red : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: image(),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Coffee Name',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: ApplicationColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        Text('Ice/Hot'),
                        SizedBox(width: 8),
                        Spacer(),
                        Icon(Icons.motorcycle_outlined, size: 28, color: ApplicationColors.kahve),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.free_breakfast_outlined,
                            size: 28,
                            color: ApplicationColors.kahve,
                          ),
                        ),
                        Icon(Icons.fastfood_rounded, size: 28, color: ApplicationColors.kahve),
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        Text('4.5'),
                        Text('(1200)'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ApplicationColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
                      'Duis aute irure dolor,',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ApplicationColors.grey,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Size',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ApplicationColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: ['S', 'M', 'L']
                          .map(
                            (size) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedSize = size;
                                });
                              },
                              child: Container(
                                height: 60,
                                width: 100, // Sabit genişlik
                                decoration: BoxDecoration(
                                  color: _selectedSize == size
                                      ? ApplicationColors.kahve
                                      : const Color.fromARGB(255, 195, 195, 195).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    size,
                                    style: TextStyle(
                                      color: _selectedSize == size
                                          ? ApplicationColors.white
                                          : ApplicationColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container image() {
    return Container(
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ApplicationColors.black.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: Image(image: AssetImage(widget.coffee.raiting!)).image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
