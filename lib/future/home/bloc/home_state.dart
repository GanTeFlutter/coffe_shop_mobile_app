part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  const HomeLoaded({required this.listCoffee});
  final List<Coffee> listCoffee;

  @override
  List<Object> get props => [listCoffee];
}

class HomeErrorState extends HomeState {
  const HomeErrorState({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
