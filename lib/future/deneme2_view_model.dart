import 'package:coffe_shop_mobile_app/future/denem2.dart';
import 'package:coffe_shop_mobile_app/product/model/address/address.dart';
import 'package:coffe_shop_mobile_app/product/state/address/cache/address_cache.dart';
import 'package:flutter/material.dart';

abstract class Deneme2ViewModel extends State<Deneme2> {
  final AddressCache addressCache = AddressCache();

  Future<void> addDamyAddress() async {
    await addressCache.addNewAddress(
      const Address(
        id: '1',
        name: 'Rize',
        description: 'Mebusevleri, Akdeniz Cd. No:31, 06570 Çankaya/Ankara',
        note: 'Not: Bu adresi seçiniz',
      ),
    );
  }
}
