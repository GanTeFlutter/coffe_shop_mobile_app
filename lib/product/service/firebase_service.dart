import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: one_member_abstracts
abstract class FirebaseBaseService {
  Future<List<T>> fetchCoffee<T>({
    required String collectionName,
    required T Function(Map<String, dynamic>) fromJson,
    required String docName,
  });
}

class FirebaseService implements FirebaseBaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<T>> fetchCoffee<T>({
    required String collectionName,
    required T Function(Map<String, dynamic>) fromJson,
    required String docName,
  }) async {
    final response =
        await _firestore.collection(collectionName).doc(docName).get();

    final data = response.data();
    if (data == null) {
      throw Exception('Data null$docName');
    }

    final coffeesArray = data['coffees'];
    if (coffeesArray == null || coffeesArray is! List) {
      throw Exception('Null veya List Degil$docName');
    }

    final models = coffeesArray.map((item) {
      if (item is Map<String, dynamic>) {
        return fromJson(item);
      } else {
        throw Exception('Map değil$docName');
      }
    }).toList();

    return models;
  }
}
