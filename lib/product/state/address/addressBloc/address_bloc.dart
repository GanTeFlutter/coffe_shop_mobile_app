import 'package:bloc/bloc.dart';
import 'package:coffe_shop_mobile_app/product/model/address/address.dart';
import 'package:coffe_shop_mobile_app/product/state/address/cache/address_cache.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(AddressInitial()) {
    on<AddressEvent>(_addressListEemit);
    on<NewSelectedAddress>(_newSelectedAddress);
  }
  final AddressCache _addressCache = AddressCache();
  Future<void> _addressListEemit(AddressEvent event, Emitter<AddressState> emit) async {
    final response = await _addressCache.loadAddressList();
    emit(AddressLoaded(listAddress: response));
  }

  Future<void> _newSelectedAddress(NewSelectedAddress event, Emitter<AddressState> emit) async {
    final currentList = await _addressCache.loadAddressList();

    // Mevcut ID'leri kontrol ederek yeni bir ID oluştur
    final ids = currentList.map((address) => int.tryParse(address.id ?? '0') ?? 0).toList();
    final newId = (ids.isNotEmpty ? ids.reduce((a, b) => a > b ? a : b) + 1 : 1).toString();

    // Yeni Address nesnesini oluştur
    final newAddress = Address(
      id: newId,
      name: event.address.name,
      description: event.address.description,
      ext: event.address.ext,
      latlong: event.address.latlong,
      note: event.address.note,
      status: event.address.status,
    );

    // Adresi kaydet
    await _addressCache.addNewAddress(newAddress);

    // Listeyi güncelleyip yeniden yay
    final updatedList = await _addressCache.loadAddressList();

    emit(AddressLoaded(listAddress: updatedList));
    debugPrint('--AddressBloc Yeni adres eklendi: ${newAddress.toJson()}');
  }
}
