part of 'address_bloc.dart';

abstract class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object> get props => [];
}

class AddressInitial extends AddressState {}

class AddressLoaded extends AddressState {
  const AddressLoaded({required this.listAddress});
  final List<Address> listAddress;

  @override
  List<Object> get props => [listAddress];
}

class AddressIdLoaded extends AddressState {
  const AddressIdLoaded({required this.addressID});
  final String addressID;

  @override
  List<Object> get props => [addressID];
}

class AddressError extends AddressState {
  const AddressError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
