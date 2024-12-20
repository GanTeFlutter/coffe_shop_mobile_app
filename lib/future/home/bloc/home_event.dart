part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInitialEvent extends HomeEvent {}

class HomeKategoryEvent extends HomeEvent {
  const HomeKategoryEvent({required this.message});
  final String message;
}
