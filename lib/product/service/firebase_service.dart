import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_shop_mobile_app/product/parcalar/enums/e.firebase_fields.dart';

// ignore: one_member_abstracts
abstract class IFirebaseService {
  Future<List<T>> fetchCollection<T>({
    required String collectionName,
    required String docName,
    required T Function(Map<String, dynamic>) fromJson,
  });
}

class FirebaseService implements IFirebaseService {
  FirebaseService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  @override
  Future<List<T>> fetchCollection<T>({
    required String collectionName,
    required String docName,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final snapshot = await _getDocumentSnapshot(collectionName, docName);
      final data = _validateData(snapshot, docName);
      final items = _validateArray(data, docName);

      return _parseItems(items, fromJson, docName);
    } catch (e) {
      throw FirebaseServiceException('Veri çekilirken hata: $e');
    }
  }

  Future<DocumentSnapshot> _getDocumentSnapshot(String collection, String doc) async {
    return _firestore.collection(collection).doc(doc).get();
  }

  Map<String, dynamic> _validateData(DocumentSnapshot snapshot, String docName) {
    final data = snapshot.data() as Map<String, dynamic>?;
    if (data == null) {
      throw FirebaseServiceException('Veri bulunamadı: $docName');
    }
    return data;
  }

  List<dynamic> _validateArray(Map<String, dynamic> data, String docName) {
    final items = data[FirebaseFields.coffees.value];
    if (items == null || items is! List<dynamic>) {
      throw FirebaseServiceException('Geçersiz veri formatı: $docName');
    }
    return items;
  }

  List<T> _parseItems<T>(
    List<dynamic> items,
    T Function(Map<String, dynamic>) fromJson,
    String docName,
  ) {
    return items.map((item) {
      if (item is! Map<String, dynamic>) {
        throw FirebaseServiceException('Geçersiz item formatı: $docName');
      }
      return fromJson(item);
    }).toList();
  }
}

class FirebaseServiceException implements Exception {
  FirebaseServiceException(this.message);
  final String message;

  @override
  String toString() => message;
}
