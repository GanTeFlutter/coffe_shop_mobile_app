// ignore_for_file: library_prefixes, inference_failure_on_instance_creation

import 'dart:async';

import 'package:coffe_shop_mobile_app/future/bootomNavBar/bottom_navigation_bar.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_strings.dart';
import 'package:coffe_shop_mobile_app/product/widget/applicaton_default_custom_button.dart'
    as customButton;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SplashViewLottie extends StatefulWidget {
  const SplashViewLottie({super.key});

  @override
  State<SplashViewLottie> createState() => _SplashViewLottieState();
}

class _SplashViewLottieState extends State<SplashViewLottie> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SplashView(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/lottieee.json'),
          ],
        ),
      ),
    );
  }
}

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    final paddingHeight = MediaQuery.of(context).size.height * 0.02;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            const Image(
              fit: BoxFit.scaleDown,
              image: AssetImage('assets/image/splash/aiCoffee.jpg'),
            ),
            linearGradient(),
            bottomTextsAndButton(context, paddingHeight),
          ],
        ),
      ),
    );
  }

  Container linearGradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            ApplicationColors.black.withOpacity(0.1),
            ApplicationColors.black.withOpacity(0.9),
            ApplicationColors.black,
          ],
        ),
      ),
    );
  }

  Positioned bottomTextsAndButton(BuildContext context, double paddingHeight) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Text(
              ApplicationStrings.splashTitleText,
              textAlign: TextAlign.center,
              style: GoogleFonts.b612(
                textStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: ApplicationColors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SizedBox(height: paddingHeight),
            Text(
              ApplicationStrings.splashTitleText2,
              textAlign: TextAlign.center,
              style: GoogleFonts.b612(
                // Burada istediğiniz fontu belirleyebilirsiniz
                textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ApplicationColors.grey,
                      fontWeight: FontWeight.w100,
                    ),
              ),
            ),
            SizedBox(height: paddingHeight),
            customButton.CustomElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomNavigationBarScreenV2(),
                  ),
                );
              },
              text: ApplicationStrings.splashbuttonText,
              borderRadius: 20,
            ),
            SizedBox(height: paddingHeight * 2),
          ],
        ),
      ),
    );
  }
}
