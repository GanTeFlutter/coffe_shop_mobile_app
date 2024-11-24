import 'package:coffe_shop_mobile_app/future/home/home_view.dart';
import 'package:coffe_shop_mobile_app/future/homeView2/home_page.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:flutter/material.dart';

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
    HomePage(),
    HomeView(),
    BosEkran1(),
    BosEkran2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              BottomNavigationBarItem(
                icon: Stack(
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: _selectedIndex == 2 ? ApplicationColors.kahve : Colors.grey,
                    ),
                    const Positioned(
                        right: 1,
                        top: 1,
                        child: Icon(Icons.circle, size: 10, color: ApplicationColors.kahve),),
                  ],
                ),
                label: '',
                activeIcon: const Icon(
                  Icons.shopping_bag,
                  color: ApplicationColors.kahve,
                ),
              ),
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

class BosEkran2 extends StatelessWidget {
  const BosEkran2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BosEkran2'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('BosEkran2'),
          ],
        ),
      ),
    );
  }
}
