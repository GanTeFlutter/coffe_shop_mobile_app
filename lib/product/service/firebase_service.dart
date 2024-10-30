// ignore_for_file: unnecessary_cast

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';

abstract class BaseFirebaseServiceModel {}

class FirebaseService implements BaseFirebaseServiceModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//jeneric olarak kullanılabilecek bir fonksiyon
//T tipinde bir liste döndürür

  Future<List<T>> firebaseService<T>(
      String modelName, T Function(Map<String, dynamic>) fromJson, String docName) async {
    // Belirli bir belgeden veri çek
    final response = await _firestore.collection(modelName).doc(docName).get();

    // Belgelerden gelen verileri modele dönüştür
    final data = response.data() as Map<String, dynamic>;
    final models = [fromJson(data)];

    return models;
  }

  Future<List<Coffee>> firebaseService2() async {
    final response = await _firestore.collection('coffee').doc('EspressoBazlıKahveler').get();
    final data = response.data() as Map<String, dynamic>;
    final models = [Coffee.fromJson(data)];
    return models;
  }

Future<List<Coffee>> firebaseService3() async {
  final response = await FirebaseFirestore.instance.collection('coffee').doc('EspressoBazlıKahveler').get();

  // Belge verilerini al
  final data = response.data() as Map<String, dynamic>?;

  if (data == null) {
    return []; // Eğer data null ise boş liste döndür
  }

  List<Coffee> coffees = [];

  // Data içindeki her bir kahve için Coffee modeline dönüştür
  data.forEach((key, value) {
    // Her bir veriyi Coffee modeline dönüştürün
    if (value is Map<String, dynamic>) {
      coffees.add(Coffee.fromJson(value));
    }
  });

  return coffees; // Coffee listesi döndür
}


}
