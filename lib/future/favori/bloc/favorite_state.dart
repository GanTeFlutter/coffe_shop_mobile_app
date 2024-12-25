part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {
    final List<Coffee> favoriteList = [];
}

class FavoriteLoaded extends FavoriteState {
  const FavoriteLoaded(this.favoriteList);
  final List<Coffee> favoriteList;

  @override
  List<Object> get props => [favoriteList];
}

class FavoriteErrorState extends FavoriteState {
  const FavoriteErrorState({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
