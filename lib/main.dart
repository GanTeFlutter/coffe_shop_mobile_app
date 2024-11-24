import 'package:coffe_shop_mobile_app/future/bootomNavBar/bottom_navigation_bar.dart';
import 'package:coffe_shop_mobile_app/future/home/bloc/home_view_bloc.dart';
import 'package:coffe_shop_mobile_app/future/splash/splash_view.dart';
import 'package:coffe_shop_mobile_app/product/init/application_start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await ApplicationStart.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeViewBloc()..add(LoadHomeView()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.light(),
        home: const BottomNavigationBarScreenV2(),
      ),
    );
  }
}
