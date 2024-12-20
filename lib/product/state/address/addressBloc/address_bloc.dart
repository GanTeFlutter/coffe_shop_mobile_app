import 'package:bloc/bloc.dart';
import 'package:coffe_shop_mobile_app/product/model/address/address.dart';
import 'package:coffe_shop_mobile_app/product/state/address/cache/address_cache.dart';
import 'package:equatable/equatable.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc({AddressCache? addressCache})
      : _addressCache = addressCache ?? AddressCache(),
        super(AddressInitial()) {
    on<LoadAddressList>(_onLoadAddresses);
    on<NewSaveAddress>(_onSaveAddress);
    on<NewSelectedAddress>(_onSelectAddress);
  }

  final AddressCache _addressCache;

  Future<void> _onLoadAddresses(LoadAddressList event, Emitter<AddressState> emit) async {
    try {
      emit(AddressLoading());
      final addresses = await _addressCache.loadAddressList();
      emit(AddressLoaded(listAddress: addresses));
    } catch (e) {
      emit(AddressError(message: 'Adresler yüklenirken hata oluştu: $e'));
    }
  }

  Future<void> _onSaveAddress(NewSaveAddress event, Emitter<AddressState> emit) async {
    try {
      emit(AddressLoading());
      final newAddress = await _createNewAddress(event.address);
      await _addressCache.addNewAddress(newAddress);

      final updatedList = await _addressCache.loadAddressList();
      emit(AddressLoaded(listAddress: updatedList));
    } catch (e) {
      emit(AddressError(message: 'Adres eklenirken hata oluştu: $e'));
    }
  }

  Future<void> _onSelectAddress(NewSelectedAddress event, Emitter<AddressState> emit) async {
    try {
      emit(AddressLoading());
      final addresses = await _addressCache.loadAddressList();
      final selected = addresses.firstWhere(
        (element) => element.id == event.addressID,
        orElse: () => throw Exception('Adres bulunamadı'),
      );
      emit(SelectedAddress(selectedAddress: selected));
    } catch (e) {
      emit(AddressError(message: 'Adres seçilirken hata oluştu: $e'));
    }
  }

  Future<Address> _createNewAddress(Address address) async {
    final addresses = await _addressCache.loadAddressList();
    final newId = _generateNewId(addresses);

    return Address(
      id: newId,
      name: address.name,
      description: address.description,
      ext: address.ext,
      latlong: address.latlong,
      note: address.note,
      status: address.status,
    );
  }

  String _generateNewId(List<Address> addresses) {
    final ids = addresses.map((address) => int.tryParse(address.id ?? '0') ?? 0).toList();
    return (ids.isEmpty ? 1 : ids.reduce((a, b) => a > b ? a : b) + 1).toString();
  }
}
