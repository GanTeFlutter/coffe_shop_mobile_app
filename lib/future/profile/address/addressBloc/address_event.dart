part of 'address_bloc.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

class LoadAddressList extends AddressEvent {}

class NewSaveAddress extends AddressEvent {
  const NewSaveAddress({required this.address});
  final Address address;

  @override
  List<Object> get props => [address];
}

class NewSelectedAddress extends AddressEvent {
  const NewSelectedAddress({required this.addressID});
  final String addressID;

  @override
  List<Object> get props => [addressID];
}
