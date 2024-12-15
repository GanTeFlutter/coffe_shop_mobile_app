part of 'single_address_bloc_bloc.dart';

abstract class SingleAddressBlocEvent extends Equatable {
  const SingleAddressBlocEvent();

  @override
  List<Object> get props => [];
}

class AddSingleAddress extends SingleAddressBlocEvent {
  const AddSingleAddress(this.address);
  final Address address;

  @override
  List<Object> get props => [address];
}
