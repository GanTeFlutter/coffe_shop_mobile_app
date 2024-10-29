part of 'home_view_bloc.dart';

@immutable
abstract class HomeViewEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadHomeView extends HomeViewEvent {}
