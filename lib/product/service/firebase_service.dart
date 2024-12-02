import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';
import 'package:flutter/foundation.dart';

abstract class BaseFirebaseServiceModel {
 Future<List<Coffee>> firebaseService(String collectionPath,String? path);
  Future<List<T>> firebaseService2<T>(String modelName,
      T Function(Map<String, dynamic>) fromJson, String docName,);
}

class FirebaseService implements BaseFirebaseServiceModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<T>> firebaseService2<T>(String modelName,
      T Function(Map<String, dynamic>) fromJson, String docName,) async {
    final response = await _firestore.collection(modelName).doc(docName).get();

    final data = response.data()!;
    final models = [fromJson(data)];

    return models;
  }
  @override
  Future<List<Coffee>> firebaseService(String collectionPath,String? path) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection('coffee')
          .doc('EspressoBazlıKahveler')
          .get();

      final data = response.data();
      if (data != null) {
        return data.entries
            .where((entry) => entry.value is Map<String, dynamic>)
            .map(
                (entry) => Coffee.fromJson(entry.value as Map<String, dynamic>),)
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      debugPrint('Error fetching data: $e');
      return [];
    }
  }
}
