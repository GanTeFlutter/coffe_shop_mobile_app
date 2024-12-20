import 'dart:convert';
import 'package:coffe_shop_mobile_app/product/model/address/address.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressCacheException implements Exception {
  AddressCacheException(this.message);
  final String message;
}

class AddressCache {
  factory AddressCache() => _instance;
  AddressCache._internal();

  static final AddressCache _instance = AddressCache._internal();
  static const String _addressListKey = 'addressList';

  Future<void> addNewAddress(Address newAddress) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final addresses = await _getAddressesFromPrefs(prefs);

      if (_isAddressExists(addresses, newAddress.id)) {
        return;
      }
      await _saveAddressToPrefs(prefs, newAddress);
    } catch (e) {
      throw AddressCacheException('Adres eklenirken hata oluştu: $e');
    }
  }

  Future<List<Address>> loadAddressList() async {
    final prefs = await SharedPreferences.getInstance();
    return _getAddressesFromPrefs(prefs);
  }

  Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_addressListKey);
  }

  Future<List<Address>> _getAddressesFromPrefs(SharedPreferences prefs) async {
    final jsonList = prefs.getStringList(_addressListKey);
    if (jsonList == null) return [];

    return jsonList
        .map((json) => Address.fromJson(jsonDecode(json) as Map<String, dynamic>))
        .toList();
  }

  bool _isAddressExists(List<Address> addresses, String? addressId) {
    return addresses.any((address) => address.id == addressId);
  }

  Future<void> _saveAddressToPrefs(SharedPreferences prefs, Address newAddress) async {
    final jsonList = prefs.getStringList(_addressListKey) ?? []
      ..add(jsonEncode(newAddress.toJson()));
    await prefs.setStringList(_addressListKey, jsonList);
  }
}
