part of 'single_address_bloc_bloc.dart';

abstract class SingleAddressBlocState extends Equatable {
  const SingleAddressBlocState();

  @override
  List<Object> get props => [];
}

class SingleAddressBlocInitial extends SingleAddressBlocState {}

class SingleAddressBlocLoading extends SingleAddressBlocState {}

class SingleAddressBlocLoaded extends SingleAddressBlocState {
  const SingleAddressBlocLoaded(this.address);

  final Address address;

  @override
  List<Object> get props => [address];
}

class SingleAddressBlocError extends SingleAddressBlocState {
  const SingleAddressBlocError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
