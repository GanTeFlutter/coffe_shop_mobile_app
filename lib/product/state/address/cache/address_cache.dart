import 'dart:convert';
import 'package:coffe_shop_mobile_app/product/model/address/address.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressCache {
  static const String _addressListKey = 'addressList';

  List<Address> saveAddressList = [];

  Future<void> removeFromList() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_addressListKey);
    debugPrint('--AddressCache Liste SharedPreferences den silindi');
  }

  Future<void> listeSonDurum() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_addressListKey);
    debugPrint('--Listemizin SonDurumu $list');
  }

  Future<void> addNewAddress(Address newAddress) async {
    final prefs = await SharedPreferences.getInstance();

    final jsonList = prefs.getStringList(_addressListKey) ?? [];

    final addressList =
        jsonList.map((json) => Address.fromJson(jsonDecode(json) as Map<String, dynamic>)).toList();

    final existingAddress = addressList.firstWhere(
      (address) => address.id == newAddress.id,
      orElse: () => const Address(
        id: '',
        name: '',
        description: '',
        ext: '',
        latlong: '',
        note: '',
        status: '',
      ),
    );

    if (existingAddress.id!.isNotEmpty) {
      debugPrint('--AddressCache Bu ID zaten mevcut: ${newAddress.id}');
      return;
    }

    jsonList.add(jsonEncode(newAddress.toJson()));

    await prefs.setStringList(_addressListKey, jsonList);

    debugPrint('--AddressCache Yeni adres eklendi: ${newAddress.toJson()}');
  }

  Future<List<Address>> loadAddressList() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_addressListKey);

    final addressList = jsonList
        ?.map((json) => Address.fromJson(jsonDecode(json) as Map<String, dynamic>))
        .toList();

    return addressList ?? [];
  }
}
