
// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollectionReferances {
  users,
  postModel,
  stores,
  product,
  favorite,
  version,
  saved_adress,
  qr_code,
  center_helps,
  basket,
  branch,
  orders;

  CollectionReference get collectRef => FirebaseFirestore.instance.collection(name);
  
}