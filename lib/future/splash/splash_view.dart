// ignore_for_file: library_prefixes, inference_failure_on_instance_creation

import 'dart:async';
import 'package:flutter/material.dart';
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
      Navigator.pushNamed(context, '/bottomNavBar');
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
