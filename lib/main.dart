import 'dart:async';

import 'package:coffe_shop_mobile_app/product/init/app_initialize.dart';
import 'package:coffe_shop_mobile_app/product/init/state_initialize.dart';
import 'package:coffe_shop_mobile_app/product/navigation/app_gorouter.dart';
import 'package:coffe_shop_mobile_app/product/theme/app_dark_theme.dart';
import 'package:coffe_shop_mobile_app/product/theme/app_light_theme.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await AppInitialize().make();
  runApp(const StateInitialize(child: _MyApp()));
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppLightTheme().themeData,
      darkTheme: AppDarkTheme().themeData,
      routerConfig: router,
    );
  }
}
