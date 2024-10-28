part of 'home_view_bloc.dart';

@immutable
abstract class HomeViewState {}

class HomeViewInitial extends HomeViewState {}

class HomeViewLoading extends HomeViewState {}

class HomeViewLoaded extends HomeViewState {}

class HomeViewError extends HomeViewState {
  final String message;
  HomeViewError(this.message);
}
