part of 'home_view_bloc.dart';

@immutable
abstract class HomeViewState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeViewInitial extends HomeViewState {}

class HomeViewLoading extends HomeViewState {}

class HomeViewLoaded extends HomeViewState {
  final List<Postmodel> coffeList;

  HomeViewLoaded({required this.coffeList});
  @override
  List<Object?> get props => [coffeList];
}

class HomeViewError extends HomeViewState {
  final String message;

  HomeViewError(this.message);

  @override
  List<Object?> get props => [message];
}
