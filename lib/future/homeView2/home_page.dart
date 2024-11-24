import 'package:coffe_shop_mobile_app/future/homeView2/home_page_model.dart';
import 'package:coffe_shop_mobile_app/future/homeView2/mixin/show_m_b.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:flutter/material.dart';

part 'widget/home_view_location.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HomePageModel with ShowModalBottomSheetMixin {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ApplicationColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                HomeViewLocation(
                  location: 'Ankara',
                  onPressed: () {
                    showModalBottomSheetCustom(screenHeight);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
