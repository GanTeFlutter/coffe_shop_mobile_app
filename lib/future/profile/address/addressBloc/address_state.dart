part of 'address_bloc.dart';

abstract class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object> get props => [];
}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressLoaded extends AddressState {
  const AddressLoaded({required this.listAddress});
  final List<Address> listAddress;

  @override
  List<Object> get props => [listAddress];
}

class AddressError extends AddressState {
  const AddressError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
