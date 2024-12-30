import 'dart:convert';
import 'package:coffe_shop_mobile_app/product/cache/address_cache.dart';
import 'package:coffe_shop_mobile_app/product/model/address/address.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AddressCache {
  factory AddressCache() {
    _instance._init();
    return _instance;
  }

  AddressCache._internal();

  static final AddressCache _instance = AddressCache._internal();
  static const String _addressListKey = 'addressList';
  SharedPreferences? _prefs;

  /// SharedPreferences'ı başlatan metot
  Future<void> _init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> addNewAddress(Address newAddress) async {
    try {
      if (_prefs == null) {
        throw AddressCacheException('SharedPreferences henüz başlatılmadı.');
      }

      final addresses = await _getAddressesFromPrefs();
      if (_isAddressExists(addresses, newAddress.id)) {
        return;
      }
      await _saveAddressToPrefs(newAddress);
    } catch (e) {
      throw AddressCacheException('Adres eklenirken hata oluştu: $e');
    }
  }

  Future<List<Address>> loadAddressList() async {
    if (_prefs == null) {
      throw AddressCacheException('SharedPreferences henüz başlatılmadı.');
    }
    return _getAddressesFromPrefs();
  }

  Future<void> clearCache() async {
    if (_prefs == null) {
      throw AddressCacheException('SharedPreferences henüz başlatılmadı.');
    }
    await _prefs!.remove(_addressListKey);
  }

  Future<List<Address>> _getAddressesFromPrefs() async {
    final jsonList = _prefs!.getStringList(_addressListKey);
    if (jsonList == null) return [];
    return jsonList
        .map((json) => Address.fromJson(jsonDecode(json) as Map<String, dynamic>))
        .toList();
  }

  bool _isAddressExists(List<Address> addresses, String? addressId) {
    return addresses.any((address) => address.id == addressId);
  }

  Future<void> _saveAddressToPrefs(Address newAddress) async {
    final jsonList = _prefs!.getStringList(_addressListKey) ?? []
      ..add(jsonEncode(newAddress.toJson()));
    await _prefs!.setStringList(_addressListKey, jsonList);
  }
}
