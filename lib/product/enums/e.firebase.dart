///Firebase Collection isimlerini tutar.
enum FirebaseCollectionName { coffee }

/// Firebase Document isimlerini tutar.
/// ebk: Espresso Bazlı Kahveler
/// sk: Soğuk Kahveler
/// stk: Sütlü Kahveler
enum FirebaseDocumentName { ebk, sk, stk }

extension FirebaseDocumentNameExtension on FirebaseDocumentName {
  String get value {
    switch (this) {
      case FirebaseDocumentName.ebk:
        return 'Espresso Bazlı Kahveler';
      case FirebaseDocumentName.sk:
        return 'Soğuk Kahveler';
      case FirebaseDocumentName.stk:
        return 'Sütlü Kahveler';
    }
  }
}
