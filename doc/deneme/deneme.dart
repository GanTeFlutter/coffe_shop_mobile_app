// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:coffe_shop_mobile_app/product/service/fire/base_model.dart';
// import 'package:flutter/material.dart';

// mixin FirebaseServiceManager {
//   Future<List<BaseFirebaseModel<T>>?> getResponseList<T>(
//     Future<QuerySnapshot> reference,
//   ) async {
//     try {
//       final response = await reference;
//       return response.docs.map((e) {
//         return BaseFirebaseModel<T>(
//           id: e.id,
//           data: e.data() is T
//               ? (e.data() as T)
//               : null
//         );
//       }).toList();
//     } catch (e) {
//       debugPrint('Error fetching data: $e');
//       return null;
//     }
//   }
// }
// class BaseFirebaseModel<T> {
//   BaseFirebaseModel({
//     required this.id,
//     required this.data,
//   });
//   final String id;
//   final T? data;
// }
