import 'package:coffe_shop_mobile_app/product/core/database/firebase_enum.dart';
import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';
import 'package:coffe_shop_mobile_app/product/service/firebase_service.dart';
import 'package:flutter/material.dart';

class DenemeScreens extends StatefulWidget {
  const DenemeScreens({super.key});

  @override
  State<DenemeScreens> createState() => _DenemeScreensState();
}

class _DenemeScreensState extends State<DenemeScreens> {
  FirebaseService firebaseService = FirebaseService();

  List<Coffee> coffees2 = [];

  Future<List<Coffee>> firebaseVeriCekme() async {
    final posts = await firebaseService.firebaseService(
        FirebaseCollectionName.coffee.name, Coffee.fromJson, 'EspressoBazlıKahveler');
    print('Firebase Veri Çekme-------: $posts');
    debugPrint('Firebase Veri Çekme-------: $posts');
    return posts;
  }

  Future<List<Coffee>> firebaseVeriCekme3() async {
    final posts = await firebaseService.firebaseService3();
    coffees2 = posts;
    print('Firebase Veri Çekme-------: $coffees2');
    return coffees2;
  }

  // Future<List<KahveModel>> firebaseVeriCekme() async {
  //   final posts = await firebaseService.firebaseService(
  //       FirebaseCollectionName.coffee.name, KahveModel.fromJson);
  //   print('Firebase Veri Çekme-------: $posts');
  //   return posts;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DenemeScreenss'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          firebaseVeriCekme3();
        },
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
