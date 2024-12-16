import 'package:coffe_shop_mobile_app/future/basket/basket_view.dart';
import 'package:coffe_shop_mobile_app/future/basket/bloc/basket_bloc.dart';
import 'package:coffe_shop_mobile_app/future/home/home_view.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBarScreenV2 extends StatefulWidget {
  const BottomNavigationBarScreenV2({super.key});

  @override
  State<BottomNavigationBarScreenV2> createState() => _BottomNavigationBarScreenV2State();
}

class _BottomNavigationBarScreenV2State extends State<BottomNavigationBarScreenV2> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = const [
    HomeView(),
    BosEkran1(),
    BasketView(),
    BosEkran1(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            backgroundColor: ApplicationColors.white,
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            showUnselectedLabels: false,
            //secili icon
            selectedItemColor: ApplicationColors.kahve,
            selectedIconTheme: const IconThemeData(size: 30),

            //secili olmayan icon
            unselectedItemColor: Colors.grey,
            enableFeedback: true,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                  color: _selectedIndex == 0 ? ApplicationColors.kahve : Colors.grey,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: _selectedIndex == 1 ? ApplicationColors.kahve : Colors.grey,
                ),
                label: '',
                activeIcon: const Icon(
                  Icons.favorite,
                  color: ApplicationColors.kahve,
                ),
              ),
              bottomNavigatonBarItem(),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications_none_rounded,
                  color: _selectedIndex == 3 ? ApplicationColors.kahve : Colors.grey,
                ),
                label: '',
                activeIcon: const Icon(
                  Icons.notifications,
                  color: ApplicationColors.kahve,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavigatonBarItem() {
    return BottomNavigationBarItem(
      icon: Stack(
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            color: _selectedIndex == 2 ? ApplicationColors.kahve : Colors.grey,
          ),
          BlocBuilder<BasketBloc, BasketState>(
            builder: (context, state) {
              var totalItems = 0;
              if (state is BasketLoaded) {
                totalItems = state.toplamAdet;
              }

              return Positioned(
                right: 0,
                top: -2,
                child: totalItems > 0
                    ? Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          color: ApplicationColors.kahve,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          totalItems.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              );
            },
          ),
        ],
      ),
      label: '',
      activeIcon: const Icon(
        Icons.shopping_bag,
        color: ApplicationColors.kahve,
      ),
    );
  }
}

class BosEkran1 extends StatelessWidget {
  const BosEkran1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BosEkran1'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('BosEkran1'),
          ],
        ),
      ),
    );
  }
}
