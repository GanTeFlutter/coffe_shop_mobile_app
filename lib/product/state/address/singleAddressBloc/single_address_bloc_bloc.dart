// ignore_for_file: require_trailing_commas

import 'package:bloc/bloc.dart';
import 'package:coffe_shop_mobile_app/product/model/address/address.dart';
import 'package:coffe_shop_mobile_app/product/state/address/cache/address_cache.dart';
import 'package:equatable/equatable.dart';

part 'single_address_bloc_event.dart';
part 'single_address_bloc_state.dart';

class SingleAddressBloc extends Bloc<SingleAddressBlocEvent, SingleAddressBlocState> {
  SingleAddressBloc() : super(SingleAddressBlocInitial()) {
    on<AddSingleAddress>(_addSingleAddress);
  }
  final AddressCache _addressCache = AddressCache();

  Future<void> _addSingleAddress(
     AddSingleAddress event, Emitter<SingleAddressBlocState> emit) async {
    //cacheden adres listesini çektik
    final response = await _addressCache.loadAddressList();
    //kullanicinin sectigi adres le listedeki adresleri karsilastirip secileni bulduk
    final selectedAddress = response.firstWhere((element) => element.id == event.address.id);
    //bulunan adresi yaydik
    emit(SingleAddressBlocLoaded(selectedAddress));
  }
}
