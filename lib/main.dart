import 'package:coffe_shop_mobile_app/future/splash/splash_view.dart';
import 'package:coffe_shop_mobile_app/product/init/application_start.dart';
import 'package:flutter/material.dart';

Future main() async {
  await ApplicationStart.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: const SplashView(),
    );
  }
}
