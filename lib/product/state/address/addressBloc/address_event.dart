part of 'address_bloc.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

class LoadAddressList extends AddressEvent {}

class NewSelectedAddress extends AddressEvent {
  const NewSelectedAddress({required this.address});
  final Address address;

  @override
  List<Object> get props => [address];
}
