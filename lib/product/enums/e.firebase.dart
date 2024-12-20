enum FirebaseCollectionName { coffee }

/// Firebase Document isimlerini tutar.
/// ebk: Espresso Bazlı Kahveler
/// sk: Soğuk Kahveler
/// stk: Sütlü Kahveler
enum FirebaseCollDocName { coffee, ebk, sk, stk }

extension FirebaseDocumentNameExtension on FirebaseCollDocName {
  String get value {
    switch (this) {
      case FirebaseCollDocName.coffee:
        return 'coffee';
      case FirebaseCollDocName.ebk:
        return 'Espresso Bazlı Kahveler';
      case FirebaseCollDocName.sk:
        return 'Soğuk Kahveler';
      case FirebaseCollDocName.stk:
        return 'Sütlü Kahveler';
    }
  }
}
