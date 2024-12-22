import 'package:coffe_shop_mobile_app/future/splash/model/page_mode.dart';
import 'package:coffe_shop_mobile_app/future/splash/splash_onboarding_view.dart';
import 'package:flutter/material.dart';

abstract class SplashOnboardingViewModel extends State<SplashOnboardingView> {
  PageController controller = PageController();
  int selectPage = 0;
  final List<PageModel> pageModelList = const [
    PageModel(
      title: 'Cassandra Clare, The Mortal Instruments',
      description: 'As long as there was coffee in the world, how bad could things be?',
      image: 'assets/image/splash/coffee_illustrasyon (3).png',
    ),
    PageModel(
      title: 'Jackie Chan',
      description: 'Coffee is a language in itself.',
      image: 'assets/image/splash/coffee_illustrasyon (5).png',
    ),
    PageModel(
      title: 'Full Satisfaction',
      description:
          'Every coffee tells a story, from the boldness of an Americano to the sweetness of a Macchiato.',
      image: 'assets/image/splash/coffee_illustrasyon (1).png',
    ),
  ];
  void actionNextScreen() {
    Navigator.pushReplacement(
      context,
      // ignore: inference_failure_on_instance_creation
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void goToNewPage() {
    if (selectPage < pageModelList.length - 1) {
      setState(() {
        selectPage += 1;
        controller.animateToPage(
          selectPage,
          duration: const Duration(milliseconds: 200),
          curve: Curves.fastOutSlowIn,
        );
      });
    } else {
      actionNextScreen();
    }
  }
}
