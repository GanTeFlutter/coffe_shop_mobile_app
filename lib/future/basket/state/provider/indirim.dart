import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Indirim with ChangeNotifier {
  bool _isIndirimButtonVisible = false;
  bool get isIndirimButtonVisible => _isIndirimButtonVisible;

  void setSelectedIndex({required bool visible}) { // Adlandırılmış parametre
    _isIndirimButtonVisible = visible;
    notifyListeners();
  }
}
