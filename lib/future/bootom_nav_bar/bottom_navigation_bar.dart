import 'package:coffe_shop_mobile_app/future/basket/basket_view.dart';
import 'package:coffe_shop_mobile_app/future/home/home_view.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:coffe_shop_mobile_app/product/state/bottom_nav_bar/page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      context.read<PageProvider>().setSelectedIndex(index);
    });
  }

  final List<Widget> _pages = const [
    HomeView(),
    BosEkran(),
    BasketView(),
    BosEkran(),
  ];

  @override
  Widget build(BuildContext context) {
    debugPrint('--BottomNavigationBarScreenV2: build');
    _selectedIndex = context.watch<PageProvider>().selectedIndex;
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
            selectedItemColor: ApplicationColors.kahve,
            selectedIconTheme: const IconThemeData(size: 30),
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
          // Sepet durumu için mevcut BlocBuilder kodu
          const Positioned(
            right: 0,
            top: -2,
            child: SizedBox.shrink(),
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

class BosEkran extends StatefulWidget {
  const BosEkran({super.key});

  @override
  State<BosEkran> createState() => _BosEkranState();
}

class _BosEkranState extends State<BosEkran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BosEkran'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
