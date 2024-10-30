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

  Future<List<Coffee>> firebaseVeriCekme3() async {
    final posts = await firebaseService.firebaseService();

    if (posts.isNotEmpty) {
      coffees2 = posts;
      print('Firebase Veri Çekme-------: $coffees2');
      return coffees2;
    } else {
      print('Firebase Veri Çekme-------: $coffees2');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DenemeScreenss'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final response = firebaseVeriCekme3();
          debugPrint('Firebase Veri Çekme-------: $response');
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: coffees2.length,
        itemBuilder: (context, index) {
          final coffee = coffees2[index];

          return ListTile(
            title: Text(coffee.name!),
            subtitle: Text(coffee.aciklama!),
            trailing: Text(coffee.fiyat!),
          );
        },
      ),
    );
  }
}
