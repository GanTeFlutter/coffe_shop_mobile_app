import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({required this.selectedIndex, required this.onTap, super.key});

  final int selectedIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: onTap,
      currentIndex: selectedIndex,
      showUnselectedLabels: false,
      selectedItemColor: ApplicationColors.kahve,
      selectedIconTheme: const IconThemeData(size: 30),
      unselectedItemColor: Colors.grey,
      enableFeedback: true,
      items: [
        _buildNavItem(Icons.home_filled, Icons.home_filled, 0),
        _buildNavItem(Icons.favorite_border_outlined, Icons.favorite, 1),
        _buildNavItem(Icons.shopping_bag_outlined, Icons.shopping_bag, 2),
        _buildNavItem(Icons.notifications_none_rounded, Icons.notifications, 3),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, IconData activeIcon, int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: selectedIndex == index ? ApplicationColors.kahve : Colors.grey,
      ),
      label: '',
      activeIcon: Icon(
        activeIcon,
        color: ApplicationColors.kahve,
      ),
    );
  }
}
